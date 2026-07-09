#!/usr/bin/env python3
"""
bench_synth.py -- assemble, link, and gem5-simulate the synthetic fuzzed
kernels (synthetic-benchmarks/<pipeline>/*.s) and save each run's gem5 stats.

Unlike the real benchmarks, these kernels come from fuzzed MLIR rather than C:
every file exports a single leaf function named `main` that takes 1-4 integer
arguments in a0.. and returns one integer in a0. The argument count is read
straight out of the assembly (the `# implicit-def: $x1{0-3}` live-in markers
the backend emits), and the matching harness -- harnesses/harness_synth_<n>arg.c
-- is compiled and linked against it. One harness per argument count is reused
for every kernel with that arity.

Usage:
  ./bench_synth.py                                 # all files, VEIR_REGALLOC_ASM
  ./bench_synth.py --limit 20                      # first 20 files only
  ./bench_synth.py --files 3_function_0.s 5_function_0.s
  ./bench_synth.py --pipelines VEIR_REGALLOC_ASM LLC_ASM_globalisel
"""

import argparse
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent

ATTRIBUTE5_RE = re.compile(r"^\s*\.attribute\s*5\s*,")
GLOBL_RE = re.compile(r"^\s*\.globl\s+([\w.$]+)", re.M)
MAX_ARITY = 4

# Pipelines whose same-named .s files describe the *same* fuzzed function.
# A kernel's argument count is the max read-before-write arity across all of
# them, so every pipeline's build of a benchmark uses one identical harness
# (identical per-iteration overhead) -- otherwise the harness overhead, which
# grows with arity, would pollute cross-pipeline cycle/instruction ratios.
REFERENCE_PIPELINES = [
    "VEIR_REGALLOC_ASM",
    "LLC_ASM_globalisel",
    "LLC_ASM_selectiondag",
]

# a0..a7 are the integer-argument registers; these kernels only ever read a0..a3
# as inputs, but a4..a7 may appear as scratch destinations.
AREG_RE = re.compile(r"\ba([0-7])\b")
INSN_RE = re.compile(r"([a-z][a-z0-9.]*)\s+(.*)")

KERNEL_SYMBOL = "bench_kernel"


def file_arity(text: str) -> int:
    """Number of leading integer-argument registers (a0..) the kernel reads
    before writing -- i.e. the values a caller must supply. The synthetic
    kernels are single-block, branch-free and register-only, so a straight
    read-before-write scan in program order is exact. Returns max-read-index+1
    (a contiguous a0.. prefix must be passed to land later args in the right
    registers), or 0 if no argument register is read."""
    written = set()
    max_read = -1
    for raw in text.splitlines():
        s = raw.split("#", 1)[0].strip()
        if not s or s.startswith(".") or s.endswith(":") or s.startswith("ret"):
            continue
        m = INSN_RE.match(s)
        if not m:
            continue
        mnem, rest = m.group(1), m.group(2)
        ops = [o.strip() for o in rest.split(",")]
        # ALU/li/mv/load: first operand is the destination. Stores have no
        # destination register (all operands are sources); these kernels have
        # no memory ops, but treat that shape conservatively anyway.
        is_store = mnem.startswith("s") and mnem in {
            "sb", "sh", "sw", "sd",
        }
        srcs = ops if is_store else ops[1:]
        dst = None if is_store else (ops[0] if ops else None)
        for o in srcs:
            for mm in AREG_RE.finditer(o):
                reg = int(mm.group(1))
                if f"a{reg}" not in written:
                    max_read = max(max_read, reg)
        if dst is not None and AREG_RE.fullmatch(dst):
            written.add(dst)
    return max_read + 1


def benchmark_arity(name: str, cache: dict) -> int:
    """Arity for a benchmark = max file_arity across the reference pipelines
    that contain it, clamped to the harnesses we ship (0..MAX_ARITY)."""
    if name in cache:
        return cache[name]
    arity = 0
    for pipe in REFERENCE_PIPELINES:
        f = SCRIPT_DIR / pipe / f"{name}.s"
        if f.is_file():
            arity = max(arity, file_arity(f.read_text()))
    arity = min(arity, MAX_ARITY)
    cache[name] = arity
    return arity


def patch_asm(text: str) -> str:
    """Rename the exported entry symbol (the fuzzed `main`) to bench_kernel so
    it does not clash with the harness's main, and neutralise the in-file
    `.attribute 5` arch string so it cannot conflict with the harness object's
    attributes at link time."""
    m = GLOBL_RE.search(text)
    if m and m.group(1) != KERNEL_SYMBOL:
        text = re.sub(rf"\b{re.escape(m.group(1))}\b", KERNEL_SYMBOL, text)

    out = []
    for line in text.splitlines(keepends=True):
        out.append("# " + line if ATTRIBUTE5_RE.match(line) else line)
    return "".join(out)


def run(cmd):
    return subprocess.run(cmd, capture_output=True, text=True)


def report_failure(name, stage, result, failed):
    print(f"  ! {stage} failed:")
    output = (result.stderr or result.stdout or "").splitlines()
    key_lines = [l for l in output if re.search(r"panic:|fatal:|[Ee]rror", l)]
    for line in (key_lines[:5] or output[-10:]):
        print(f"    {line.strip()}")
    failed.append(f"{name}: {stage}")


def main():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "results_dir",
        type=Path,
        nargs="?",
        default=SCRIPT_DIR / "results" / "gem5" / "stats",
        help="where to save raw <name>_<pipeline>.stats.txt "
        "(default: synthetic-benchmarks/results/gem5/stats/)",
    )
    parser.add_argument(
        "--pipelines",
        nargs="+",
        default=REFERENCE_PIPELINES,
        help="pipeline asm folders under synthetic-benchmarks/ to simulate",
    )
    parser.add_argument(
        "--files",
        nargs="+",
        default=None,
        help="specific .s filenames to run (default: every .s in the pipeline)",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=None,
        help="only run the first N files (after sorting)",
    )
    parser.add_argument(
        "--gem5-dir",
        type=Path,
        # gem5 is a submodule at the repo root, one level up from this script.
        default=Path(os.environ.get("GEM5_DIR", SCRIPT_DIR.parent / "gem5")),
    )
    parser.add_argument(
        "--harness-dir",
        type=Path,
        default=SCRIPT_DIR / "harnesses",
    )
    parser.add_argument(
        "--cpu-type", default=os.environ.get("CPU_TYPE", "TimingSimpleCPU")
    )
    parser.add_argument(
        "--march",
        # Covers every extension the synthetic kernels use
        # (rv64i + m/zmmul, zba,zbb,zbc,zbs, zbkb,zbkc, zicond).
        default=os.environ.get(
            "MARCH", "rv64gc_zba_zbb_zbc_zbs_zbkb_zbkc_zicond"
        ),
    )
    parser.add_argument("--sysroot", default="/usr/riscv64-linux-gnu")
    parser.add_argument(
        "--iters",
        type=int,
        default=None,
        help="override the harness ITERS loop count (default: harness value)",
    )
    args = parser.parse_args()

    gem5_bin = args.gem5_dir / "build" / "RISCV" / "gem5.opt"
    se_config = args.gem5_dir / "configs" / "deprecated" / "example" / "se.py"
    m5_include = args.gem5_dir / "include"
    m5_lib = args.gem5_dir / "util" / "m5" / "build" / "riscv" / "out"

    if not gem5_bin.is_file():
        sys.exit(f"gem5 binary not found: {gem5_bin} (build gem5 first)")

    args.results_dir.mkdir(parents=True, exist_ok=True)
    work_dir = Path(tempfile.mkdtemp(prefix="synth_bench_"))
    failed = []
    ran = 0
    arity_cache = {}

    try:
        for pipeline in args.pipelines:
            pipe_dir = SCRIPT_DIR / pipeline
            if not pipe_dir.is_dir():
                print(f"! missing pipeline dir {pipe_dir} -- skipping")
                continue

            if args.files:
                asm_files = [pipe_dir / f for f in args.files]
            else:
                asm_files = sorted(pipe_dir.glob("*.s"))
            if args.limit is not None:
                asm_files = asm_files[: args.limit]

            print(f"=== pipeline {pipeline}: {len(asm_files)} files ===")
            for asm_file in asm_files:
                name = asm_file.stem
                if not asm_file.is_file():
                    print(f"  ! missing {asm_file.name}")
                    failed.append(f"{name}: missing asm")
                    continue

                asm_text = asm_file.read_text()
                # Arity is a property of the benchmark, not this one build:
                # take the max across pipelines so every pipeline uses the same
                # harness (see benchmark_arity / REFERENCE_PIPELINES).
                arity = benchmark_arity(name, arity_cache)
                harness_src = args.harness_dir / f"harness_synth_{arity}arg.c"
                if not harness_src.is_file():
                    print(f"  ! {name}: no harness for arity {arity}")
                    failed.append(f"{name}: no harness (arity {arity})")
                    continue

                bench_work = work_dir / f"{pipeline}_{name}"
                bench_work.mkdir(parents=True, exist_ok=True)

                # --- compile the harness for this arity
                harness_obj = bench_work / "harness.o"
                cc = [
                    "clang",
                    "--target=riscv64-linux-gnu",
                    f"--sysroot={args.sysroot}",
                    f"-I{m5_include}",
                ]
                if args.iters is not None:
                    cc.append(f"-DITERS={args.iters}")
                cc += ["-c", str(harness_src), "-o", str(harness_obj)]
                res = run(cc)
                if res.returncode != 0:
                    report_failure(name, "harness compile", res, failed)
                    continue

                # --- patch + assemble the kernel
                work_asm = bench_work / f"{name}.s"
                work_asm.write_text(patch_asm(asm_text))
                obj_file = bench_work / f"{name}.o"
                res = run(
                    [
                        "riscv64-linux-gnu-gcc",
                        f"-march={args.march}",
                        "-c",
                        str(work_asm),
                        "-o",
                        str(obj_file),
                    ]
                )
                if res.returncode != 0:
                    report_failure(name, "assemble", res, failed)
                    continue

                # --- link
                bin_file = bench_work / f"bench_{name}"
                res = run(
                    [
                        "clang",
                        "--target=riscv64-linux-gnu",
                        f"--sysroot={args.sysroot}",
                        "-fuse-ld=lld",
                        "-static",
                        str(harness_obj),
                        str(obj_file),
                        "-o",
                        str(bin_file),
                        f"-I{m5_include}",
                        f"-L{m5_lib}",
                        "-lm5",
                    ]
                )
                if res.returncode != 0:
                    report_failure(name, "link", res, failed)
                    continue

                # --- simulate
                gem5_outdir = bench_work / "m5out"
                res = run(
                    [
                        str(gem5_bin),
                        f"--outdir={gem5_outdir}",
                        str(se_config),
                        f"--cpu-type={args.cpu_type}",
                        "--caches",
                        "-c",
                        str(bin_file),
                    ]
                )
                if res.returncode != 0:
                    report_failure(name, "simulate", res, failed)
                    continue

                stats_dst = args.results_dir / f"{name}_{pipeline}.stats.txt"
                shutil.copy(gem5_outdir / "stats.txt", stats_dst)
                ran += 1
                print(f"  ok  {name} (arity {arity}) -> {stats_dst.name}")
    finally:
        shutil.rmtree(work_dir, ignore_errors=True)

    print(f"\n==== ran {ran} simulation(s), {len(failed)} failure(s) ====")
    for f in failed:
        print(f"  FAIL {f}")
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
