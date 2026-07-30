#!/usr/bin/env python3
"""
run_benchmarks.py -- assemble, link, and gem5-simulate a list of benchmarks
across multiple pipeline directories. Saves each run's gem5 stats uniquely
identified by the benchmark and pipeline name.

Usage:
  ./run_benchmarks.py --benchmarks matmul sort bfs \
                      --pipelines pipe_A pipe_B pipe_C \
                      --harness-dir src_harnesses \
                      [results_dir] [options]
"""

import argparse
import collections
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ATTRIBUTE5_RE = re.compile(r"^\s*\.attribute\s*5\s*,")
GLOBL_RE = re.compile(r"^\s*\.globl\s+([\w.$]+)", re.M)
CHECKSUM_RE = re.compile(r"CHECKSUM:\s*(0x[0-9a-fA-F]+)")


def patch_asm(text: str, func_name: str) -> str:
    """Strip the legacy '_b1p0' token, neutralize the in-file
    .attribute 5, and rename the entry symbol to the expected function name."""
    text = text.replace("_b1p0", "")

    # The pipelines disagree on the entry symbol ('main', 'sha256',
    # 'sha256_block', ...): rename whatever the asm actually exports
    # (its first .globl) to the name the harness calls.
    m = GLOBL_RE.search(text)
    if m and m.group(1) != func_name:
        text = re.sub(rf"\b{re.escape(m.group(1))}\b", func_name, text)

    out_lines = []
    for line in text.splitlines(keepends=True):
        if ATTRIBUTE5_RE.match(line):
            out_lines.append("# " + line)
        else:
            out_lines.append(line)
    return "".join(out_lines)


def run(cmd):
    """subprocess.run wrapper that always captures output as text."""
    return subprocess.run(cmd, capture_output=True, text=True)


def report_failure(name, pipeline, stage, result, failed):
    print(f"  ! [{pipeline}] {stage} failed:")
    output = (result.stderr or result.stdout or "").splitlines()
    # gem5 buries the actual error under a long libc backtrace: surface any
    # panic/fatal/error lines first, then the tail for context.
    key_lines = [
        l for l in output if re.search(r"panic:|fatal:|[Ee]rror", l)
    ]
    for line in key_lines[:5]:
        print(f"    {line.strip()}")
    if not key_lines:
        for line in output[-10:]:
            print(f"    {line}")
    failed.append(f"{name} ({pipeline}): {stage}")


BENCHMARKS = [
    "fastntt.c",
    "sha256.c",
    "libdivide_s64_recover.c",
    "libdivide_s32_recover.c",
    "libdivide_s64_do_raw.c",
    "libdivide_s32_do_raw.c",
    "libdivide_u32_do_raw.c",
    "libdivide_s64_branchfree_do.c",
    "libdivide_s32_branchfree_do.c",
    "libdivide_internal_u64_gen.c",
    "libdivide_internal_s64_gen.c",
]

# Where the generation pipeline (llvm-riscv-backend-evaluation) writes its asm.
# This script lives in real-benchmarks/ alongside the pipeline asm folders.
ASM_ROOT = Path(__file__).resolve().parent

PIPELINES = [
    "LLC_ASM_globalisel",
    "LLC_ASM_selectiondag",
    "VEIR_REGALLOC_ASM",
    "VEIR_OPT_REGALLOC_ASM",
]

# Harness filename (relative to --harness-dir), when it does not follow
# the standard harness_<benchmark>.c naming.
harness_mapping = {
    "libdivide_s64_recover.c": "harness_libdivide_s64_recover.c",
    "libdivide_s32_recover.c": "harness_libdivide_s32_recover.c",
    "libdivide_s64_do_raw.c": "harness_libdivide_s64_do_raw.c",
    "libdivide_s32_do_raw.c": "harness_libdivide_s32_do_raw.c",
    "libdivide_u32_do_raw.c": "harness_libdivide_u32_do_raw.c",
    "libdivide_s64_branchfree_do.c": "harness_libdivide_s64_branchfree_do.c",
    "libdivide_s32_branchfree_do.c": "harness_libdivide_s32_branchfree_do.c",
    "libdivide_internal_u64_gen.c": "harness_libdivide_internal_u64_gen.c",
    "libdivide_internal_s64_gen.c": "harness_libdivide_internal_s64_gen.c",
}

# Function name the harness calls, when it differs from the file stem.
# The libdivide harnesses all call the kernel as 'bench_kernel': the real
# names collide with libdivide.h's static-inline reference implementations
# (which the harnesses include for setup and correctness checking).
entry_point_mapping = {
    "sha256.c": "sha256",
    "fastntt.c": "fastNTT",
    "libdivide_s64_recover.c": "bench_kernel",
    "libdivide_s32_recover.c": "bench_kernel",
    "libdivide_s64_do_raw.c": "bench_kernel",
    "libdivide_s32_do_raw.c": "bench_kernel",
    "libdivide_u32_do_raw.c": "bench_kernel",
    "libdivide_s64_branchfree_do.c": "bench_kernel",
    "libdivide_s32_branchfree_do.c": "bench_kernel",
    "libdivide_internal_u64_gen.c": "bench_kernel",
    "libdivide_internal_s64_gen.c": "bench_kernel",
}


def main():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    parser.add_argument(
        "results_dir",
        type=Path,
        nargs="?",
        default=Path(__file__).resolve().parent / "results",
        help="where to save <name>_<pipeline>.stats.txt "
        "(default: real-benchmarks/results/)",
    )
    parser.add_argument(
        "--gem5-dir",
        type=Path,
        # gem5 is a submodule at the repo root, one level up from this script.
        default=Path(
            os.environ.get(
                "GEM5_DIR", Path(__file__).resolve().parent.parent / "gem5"
            )
        ),
    )
    parser.add_argument(
        "--cpu-type", default=os.environ.get("CPU_TYPE", "TimingSimpleCPU")
    )
    parser.add_argument(
        "--default-march",
        # Must cover every extension the generation pipeline targets
        # (its llc runs with +m,+zba,+zbb,+zbs,+zbc,+zbkb,+zicond).
        default=os.environ.get(
            "DEFAULT_MARCH", "rv64gc_zba_zbb_zbc_zbs_zbkb_zicond"
        ),
    )
    parser.add_argument("--sysroot", default="/usr/riscv64-linux-gnu")

    # Missing CLI arguments mapped to the global defaults
    parser.add_argument(
        "--benchmarks",
        nargs="+",
        default=BENCHMARKS,
        help="List of benchmarks to run",
    )
    parser.add_argument(
        "--asm-root",
        type=Path,
        default=ASM_ROOT,
        help="Directory containing the pipeline asm folders",
    )
    parser.add_argument(
        "--pipelines",
        nargs="+",
        type=Path,
        default=[Path(p) for p in PIPELINES],
        help="Pipeline directories, resolved against --asm-root unless absolute",
    )
    parser.add_argument(
        "--harness-dir",
        type=Path,
        default=Path(__file__).resolve().parent / "harnesses",
        help="Directory containing the harness source files",
    )

    args = parser.parse_args()

    # Pipeline asm folders live in the generation repo unless given as absolute
    args.pipelines = [
        p if p.is_absolute() else args.asm_root / p for p in args.pipelines
    ]

    gem5_bin = args.gem5_dir / "build" / "RISCV" / "gem5.opt"
    se_config = args.gem5_dir / "configs" / "deprecated" / "example" / "se.py"
    m5_include = args.gem5_dir / "include"
    m5_lib = args.gem5_dir / "util" / "m5" / "build" / "riscv" / "out"

    args.results_dir.mkdir(parents=True, exist_ok=True)
    work_dir = Path(tempfile.mkdtemp(prefix="riscv_bench_"))

    failed = []
    results_matrix = collections.defaultdict(dict)
    checksums = collections.defaultdict(dict)

    try:
        for bench_file in args.benchmarks:
            bench_path = Path(bench_file)
            name = bench_path.stem
            print(f"=== {name} ===")

            expected_func = entry_point_mapping.get(bench_path.name, name)

            # Resolve harness file using mapping or fallback to standard naming
            harness_filename = harness_mapping.get(
                bench_path.name, f"harness_{name}.c"
            )
            harness_src = args.harness_dir / harness_filename

            if not harness_src.is_file():
                print(f"  ! missing {harness_src.name} -- skipping entirely")
                for p in args.pipelines:
                    results_matrix[name][p.name] = "NO HARNESS"
                continue

            march_file = args.harness_dir / f"{name}.march"
            march = (
                march_file.read_text().strip()
                if march_file.is_file()
                else args.default_march
            )

            # Compile the harness once per benchmark
            bench_work_dir = work_dir / name
            bench_work_dir.mkdir(exist_ok=True)
            harness_obj = bench_work_dir / f"harness_{name}.o"

            res_harness = run(
                [
                    "clang",
                    "--target=riscv64-linux-gnu",
                    f"--sysroot={args.sysroot}",
                    f"-I{m5_include}",
                    # libdivide.h lives next to this script, in real-benchmarks/
                    f"-I{Path(__file__).resolve().parent}",
                    "-c",
                    str(harness_src),
                    "-o",
                    str(harness_obj),
                ]
            )

            if res_harness.returncode != 0:
                report_failure(
                    name,
                    "ALL",
                    "harness compile",
                    res_harness,
                    failed,
                )
                for p in args.pipelines:
                    results_matrix[name][p.name] = "FAIL (harness)"
                continue

            # Iterate over the pipelines
            for pipe_path in args.pipelines:
                pipe_name = pipe_path.name
                print(f"  -> Pipeline: {pipe_name}")

                # Assume the assembly file is named <benchmark_name>.s within the pipeline directory
                asm_file = pipe_path / f"{name}.s"
                if not asm_file.is_file():
                    print(f"     ! missing {asm_file.name} in {pipe_name}")
                    results_matrix[name][pipe_name] = "NO ASM"
                    continue

                # --- Step 1: patch and assemble.
                work_asm = bench_work_dir / f"{name}_{pipe_name}.s"

                # Pass the benchmark 'name' so the regex knows what to rename 'main' to
                work_asm.write_text(
                    patch_asm(asm_file.read_text(), expected_func)
                )

                # Produces pipeline_name.o inside the benchmark's work directory
                obj_file = bench_work_dir / f"{pipe_name}.o"
                res_asm = run(
                    [
                        "riscv64-linux-gnu-gcc",
                        f"-march={march}",
                        "-c",
                        str(work_asm),
                        "-o",
                        str(obj_file),
                    ]
                )

                if res_asm.returncode != 0:
                    report_failure(
                        name,
                        pipe_name,
                        f"assemble (march={march})",
                        res_asm,
                        failed,
                    )
                    results_matrix[name][pipe_name] = "FAIL (asm)"
                    continue

                # --- Step 2: link harness object with the pipeline-specific kernel object
                bin_file = bench_work_dir / f"bench_{name}_{pipe_name}"
                res_link = run(
                    [
                        "clang",
                        "--target=riscv64-linux-gnu",
                        f"--sysroot={args.sysroot}",
                        "--gcc-toolchain=/usr",
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

                if res_link.returncode != 0:
                    report_failure(name, pipe_name, "link", res_link, failed)
                    results_matrix[name][pipe_name] = "FAIL (link)"
                    continue

                # --- Step 3: simulate.
                gem5_outdir = bench_work_dir / f"m5out_{pipe_name}"
                res_sim = run(
                    [
                        str(gem5_bin),
                        f"--outdir={gem5_outdir}",
                        "--show-exit-event-messages",  # Explicitly save to a file
                        str(se_config),
                        f"--cpu-type={args.cpu_type}",
                        "--caches",
                        "-c",
                        str(bin_file),
                    ]
                )

                if res_sim.returncode != 0:
                    # gem5 propagates the simulated exit code: a clean gem5
                    # run with a nonzero code means the harness's built-in
                    # correctness check found mismatches.
                    sim_out = (res_sim.stderr or "") + (res_sim.stdout or "")
                    if res_sim.returncode > 0 and not re.search(
                        r"panic:|fatal:", sim_out
                    ):
                        print(
                            f"     ! [{pipe_name}] correctness check failed"
                            f" (exit code {res_sim.returncode})"
                        )
                        failed.append(f"{name} ({pipe_name}): wrong result")
                        results_matrix[name][pipe_name] = "WRONG RESULT"
                    else:
                        report_failure(
                            name, pipe_name, "simulate", res_sim, failed
                        )
                        results_matrix[name][pipe_name] = "FAIL (sim)"
                    continue

                # Record the harness-reported output checksum (if any) to
                # compare results across pipelines.
                m = CHECKSUM_RE.search(res_sim.stdout or "")
                if m:
                    checksums[name][pipe_name] = m.group(1)

                # Save specific stats file
                stats_src = gem5_outdir / "stats.txt"
                stats_dst = args.results_dir / f"{name}_{pipe_name}.stats.txt"
                shutil.copy(stats_src, stats_dst)
                results_matrix[name][pipe_name] = "ok"

    finally:
        shutil.rmtree(work_dir, ignore_errors=True)

    print("\n==================== Execution Summary ====================")

    # Render a pivoted matrix comparing status across all pipelines
    pipelines = [p.name for p in args.pipelines]
    bench_names = [Path(b).stem for b in args.benchmarks]

    header_row = ["Benchmark"] + pipelines

    # Calculate appropriate widths safely
    max_bench_len = max([len(b) for b in bench_names] + [15])
    col_widths = [max_bench_len] + [max(len(p), 12) for p in pipelines]

    header_str = " | ".join(
        f"{h:<{w}}" for h, w in zip(header_row, col_widths)
    )
    print(header_str)
    print("-+-".join("-" * w for w in col_widths))

    for name in bench_names:
        # Use .get() to avoid KeyErrors if a benchmark entirely failed or skipped
        row = [name] + [results_matrix[name].get(p, "N/A") for p in pipelines]
        row_str = " | ".join(
            f"{str(item):<{w}}" for item, w in zip(row, col_widths)
        )
        print(row_str)

    print("\n===========================================================")

    # Cross-pipeline result consistency: every pipeline of a benchmark must
    # report the same output checksum. (The libdivide harnesses additionally
    # validate in-process against libdivide.h: a wrong result there also
    # shows up as WRONG RESULT in the matrix above.)
    if checksums:
        print("\n============= Result consistency (checksums) ==============")
        for name in bench_names:
            sums = checksums.get(name)
            if not sums:
                continue
            unique = set(sums.values())
            if len(unique) == 1:
                print(f"{name:<{max_bench_len}} IDENTICAL {unique.pop()}")
            else:
                print(f"{name:<{max_bench_len}} *** MISMATCH ***")
                for p, s in sums.items():
                    print(f"  {p:<30} {s}")
                failed.append(f"{name}: checksum mismatch across pipelines")
        print("===========================================================")

    if failed:
        sys.exit(1)
    else:
        sys.exit(0)


if __name__ == "__main__":
    main()
