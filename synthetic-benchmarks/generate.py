#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.12"
# dependencies = ["utils"]
#
# [tool.uv.sources]
# utils = { path = "../utils" }
# ///

import concurrent.futures
import glob
import os
import random
import re
import subprocess
import sys
import argparse

from utils.generate import (
    setup_benchmarking_directories,
    cleanup_empty_logs,
    interpret_function,
    extract_all,
    MLIR_opt,
    LLVM_opt,
    MLIR_to_LLVM,
    LLVM_to_MLIR,
    LLC_selectiondag,
    LLC_globalisel,
    VEIR,
    LLC_mir_regalloc,
    replace_hyphens_in_variables,
    rewrite_value_attr_to_immediate,
    rename_numeric_block_labels,
    apply_lowering_to_folder,
    extract_basic_block_folder,
    VEIR2MIR,
)


ROOT_DIR_PATH = (
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode("utf-8")
    .strip()
)

TIMEOUT = 1800


LLVM_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/LLVM/"
LLVMIR_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/LLVMIR/"

MLIR_bb0_VEIR_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/MLIR_bb0_veir/"
MLIR_single_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/MLIR_single/"
MLIR_multi_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/MLIR_multi/"


LLC_ASM_selectiondag_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/LLC_ASM_selectiondag/"

LLC_ASM_globalisel_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/LLC_ASM_globalisel/"
VEIR_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/VEIR_ASM/"
VEIR_MIR_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/VEIR_MIR/"
VEIR_REGALLOC_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/VEIR_REGALLOC_ASM/"

VEIR2MIR_BIN = f"{ROOT_DIR_PATH}/veir/.lake/build/bin/veir2mir"
VEIROPT_BIN = f"{ROOT_DIR_PATH}/veir/.lake/build/bin/veir-opt"

LLVM_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/LLVM_preopt/"

MLIR_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/MLIR_preopt/"

LOGS_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/logs/"

# separate from logs/: cleanup_empty_logs counts every non-empty file there
# as a failed lowering
INTERPRET_LOGS_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/interpret_logs/"

VEIR_INTERPRET_BIN = f"{ROOT_DIR_PATH}/veir/.lake/build/bin/veir-interpret"

# on-demand candidate generation, used when a MLIR_multi corpus file runs out
# before `num` functions survive the interpret filter
MLIR_FUZZ_DIR = os.path.expanduser("~/mlir-fuzz")
MLIR_ENUMERATE_BIN = f"{MLIR_FUZZ_DIR}/build/bin/mlir-enumerate"
MLIR_FUZZ_DIALECTS = f"{MLIR_FUZZ_DIR}/dialects/llvm.mlir"
MLIR_multi_generated_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/MLIR_multi_generated/"
BATCH_SIZE = 500

# staging area for extracted candidates while they await their interpret-filter
# verdict; survivors are moved to MLIR_single, the rest stay here
MLIR_candidates_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/MLIR_candidates/"


AUTOGEN_DIR_PATHS = [
    LLVM_DIR_PATH,
    LLVMIR_DIR_PATH,
    MLIR_single_DIR_PATH,
    MLIR_bb0_VEIR_DIR_PATH,
    LLC_ASM_selectiondag_DIR_PATH,
    LLC_ASM_globalisel_DIR_PATH,
    VEIR_ASM_DIR_PATH,
    VEIR_MIR_DIR_PATH,
    VEIR_REGALLOC_ASM_DIR_PATH,
    LOGS_DIR_PATH,
    INTERPRET_LOGS_DIR_PATH,
    MLIR_multi_generated_DIR_PATH,
    MLIR_candidates_DIR_PATH,
    LLVM_OPTIMIZED_DIR_PATH,
    MLIR_OPTIMIZED_DIR_PATH,
]


def candidate_rng(seed, size, tag, idx):
    """
    Independent, reproducible input stream per candidate. Seeding by string is
    stable across runs, and per-candidate streams make the interpret verdicts
    independent of test order, so the filter can run in parallel and the
    survivor set does not depend on -j.
    """
    return random.Random(f"{seed}:{size}:{tag}:{idx}")


def promote_candidate(cand_path, size, index):
    """Move a surviving candidate into MLIR_single and rename its interpret artifacts."""
    cand_stem = os.path.splitext(os.path.basename(cand_path))[0]
    final_stem = f"{size}_function_{index}"
    os.rename(cand_path, os.path.join(MLIR_single_DIR_PATH, final_stem + ".mlir"))
    artifacts = [os.path.join(INTERPRET_LOGS_DIR_PATH, cand_stem + ".log")]
    artifacts += glob.glob(os.path.join(INTERPRET_LOGS_DIR_PATH, cand_stem + "_trial*"))
    for path in artifacts:
        base = os.path.basename(path)
        os.rename(
            path,
            os.path.join(INTERPRET_LOGS_DIR_PATH, final_stem + base[len(cand_stem):]),
        )


def batch_seed(seed, size, batch_idx):
    """Deterministic, distinct mlir-enumerate seed per (--seed, size, batch)."""
    return (seed * 1000003 + size * 10007 + batch_idx + 1) % (2**31 - 1)


def log_generated_batch(batch_file, seed):
    log_path = os.path.join(MLIR_multi_generated_DIR_PATH, "version_log.txt")
    if not os.path.exists(log_path):
        commit = (
            subprocess.check_output(
                ["git", "-C", MLIR_FUZZ_DIR, "rev-parse", "--short", "HEAD"]
            )
            .decode("utf-8")
            .strip()
        )
        with open(log_path, "w") as f:
            f.write(f"MLIR-fuzz commit hash: {commit}\n")
    with open(log_path, "a") as f:
        f.write(f"{os.path.basename(batch_file)}: seed {seed}\n")


def generate_candidate_batch(size, seed, batch_file):
    """Generate BATCH_SIZE candidate functions of the given size with mlir-enumerate."""
    cmd = [
        MLIR_ENUMERATE_BIN,
        MLIR_FUZZ_DIALECTS,
        "--configuration=llvm",
        "--exact-size=1",
        f"--max-num-ops={size}",
        "--min-num-args=1",
        "--strategy=random",
        f"--max-programs={BATCH_SIZE}",
        "--constant-kind=none",
        f"--seed={seed}",
    ]
    try:
        with open(batch_file, "w") as out:
            proc = subprocess.run(cmd, stdout=out, stderr=subprocess.PIPE, timeout=TIMEOUT)
    except subprocess.TimeoutExpired:
        print(f"mlir-enumerate: timeout of {TIMEOUT} seconds reached")
        return 1
    if proc.returncode != 0:
        print(proc.stderr.decode("utf-8", errors="replace"))
        return proc.returncode
    log_generated_batch(batch_file, seed)
    return 0


def generate_benchmarks(num, jobs, seed):
    if not os.path.isfile(VEIR_INTERPRET_BIN):
        print(f"error: {VEIR_INTERPRET_BIN} not found; build it with ./build.sh")
        return 1

    setup_benchmarking_directories(AUTOGEN_DIR_PATHS)

    # Extract single MLIR blocks, keeping only functions that return a
    # numerical result under veir-interpret for at least one of 10 random
    # input sets. Candidates are tested `jobs` at a time; each candidate has
    # its own PRNG stream so the surviving set is deterministic regardless of
    # -j. The first `num` passers in candidate order are promoted to
    # MLIR_single. When a corpus file runs out before `num` survivors are
    # found, generate more candidates on demand with mlir-enumerate, in
    # seeded batches.
    def test_candidates(cand_specs, needed, stats):
        """cand_specs: ordered (path, rng) pairs. Returns the first `needed` passer paths."""
        passers = []
        i = 0
        while i < len(cand_specs) and len(passers) < needed:
            chunk = cand_specs[i : i + max(2 * jobs, needed - len(passers))]
            i += len(chunk)
            with concurrent.futures.ThreadPoolExecutor(max_workers=jobs) as pool:
                verdicts = list(
                    pool.map(
                        lambda spec: interpret_function(
                            spec[0],
                            spec[1],
                            VEIR_INTERPRET_BIN,
                            INTERPRET_LOGS_DIR_PATH,
                            ROOT_DIR_PATH,
                            TIMEOUT,
                        ),
                        chunk,
                    )
                )
            stats["tested"] += len(chunk)
            passers += [spec[0] for spec, keep in zip(chunk, verdicts) if keep]
        return passers[:needed]

    for file in sorted(os.listdir(MLIR_multi_DIR_PATH)):
        if re.fullmatch(r"output_\d+\.mlir", file) is None:
            continue
        size = int(file.split("_")[-1].split(".")[0])
        input_file = os.path.join(MLIR_multi_DIR_PATH, file)
        replace_hyphens_in_variables(input_file)
        stats = {"tested": 0}
        kept = 0
        max_candidates = max(200 * num, 5000)

        def filter_source(source_file, tag, kept):
            candidates = extract_all(
                source_file, MLIR_candidates_DIR_PATH, f"{size}_{tag}_"
            )
            specs = [
                (path, candidate_rng(seed, size, tag, idx))
                for idx, path in enumerate(candidates)
            ]
            for path in test_candidates(specs, num - kept, stats):
                promote_candidate(path, size, kept)
                kept += 1
            return kept

        kept = filter_source(input_file, "corpus", kept)

        batch_idx = 0
        while kept < num:
            if not os.path.isfile(MLIR_ENUMERATE_BIN):
                print(
                    f"error: only {kept}/{num} functions of size {size} survived the "
                    f"interpret filter and {MLIR_ENUMERATE_BIN} does not exist to "
                    "generate more candidates; install mlir-fuzz at ~/mlir-fuzz (see README)"
                )
                return 1
            if stats["tested"] >= max_candidates:
                print(
                    f"error: tested {stats['tested']} candidates of size {size} but only "
                    f"{kept}/{num} survived the interpret filter; giving up"
                )
                return 1
            batch_file = os.path.join(
                MLIR_multi_generated_DIR_PATH, f"output_{size}_batch{batch_idx}.mlir"
            )
            ret = generate_candidate_batch(size, batch_seed(seed, size, batch_idx), batch_file)
            if ret != 0:
                print(f"error: mlir-enumerate failed (exit {ret}) generating {batch_file}")
                return 1
            replace_hyphens_in_variables(batch_file)
            kept = filter_source(batch_file, f"batch{batch_idx}", kept)
            batch_idx += 1

        print(
            f"[interpret-filter] size {size}: {stats['tested']} tested, "
            f"{kept} kept, {stats['tested'] - kept} discarded, "
            f"{batch_idx} generated batches"
        )

    # Extraction's return code is always 0
    mlir_extract_ret = dict()
    for filename in os.listdir(MLIR_single_DIR_PATH):
        mlir_extract_ret[os.path.join(MLIR_single_DIR_PATH, filename)] = 0

    # MLIR-opt to lift func.func and print in generic syntax
    MLIR_opt_file2ret = dict()
    apply_lowering_to_folder(
        MLIR_single_DIR_PATH,
        LLVMIR_DIR_PATH,
        LOGS_DIR_PATH,
        mlir_extract_ret,
        MLIR_opt_file2ret,
        MLIR_opt,
        ROOT_DIR_PATH,
        TIMEOUT,
        "MLIR-opt",
        ".mlir",
    )

    # LLVMIR to LLVM
    MLIR_translate_file2ret = dict()
    apply_lowering_to_folder(
        LLVMIR_DIR_PATH,
        LLVM_DIR_PATH,
        LOGS_DIR_PATH,
        MLIR_opt_file2ret,
        MLIR_translate_file2ret,
        MLIR_to_LLVM,
        ROOT_DIR_PATH,
        TIMEOUT,
        "MLIR-translate",
        ".ll",
    )

    # LLVM opt
    llvmir_file2ret = dict()
    apply_lowering_to_folder(
        LLVM_DIR_PATH,
        LLVM_OPTIMIZED_DIR_PATH,
        LOGS_DIR_PATH,
        MLIR_translate_file2ret,
        llvmir_file2ret,
        LLVM_opt,
        ROOT_DIR_PATH,
        TIMEOUT,
        "LLVM-opt",
        ".ll",
    )

    # LLVM to MLIR to extract bb0
    MLIR_preopt_file2ret = dict()
    apply_lowering_to_folder(
        LLVM_OPTIMIZED_DIR_PATH,
        MLIR_OPTIMIZED_DIR_PATH,
        LOGS_DIR_PATH,
        llvmir_file2ret,
        MLIR_preopt_file2ret,
        LLVM_to_MLIR,
        ROOT_DIR_PATH,
        TIMEOUT,
        "MLIR-translate",
        ".mlir",
    )

    # selectionDAG
    LLC_file2ret = dict()
    apply_lowering_to_folder(
        LLVM_OPTIMIZED_DIR_PATH,
        LLC_ASM_selectiondag_DIR_PATH,
        LOGS_DIR_PATH,
        llvmir_file2ret,
        LLC_file2ret,
        LLC_selectiondag,
        ROOT_DIR_PATH,
        TIMEOUT,
        "LLC-selectionDAG",
        ".s",
    )

    # globalisel
    LLC_file2ret = dict()
    apply_lowering_to_folder(
        LLVM_OPTIMIZED_DIR_PATH,
        LLC_ASM_globalisel_DIR_PATH,
        LOGS_DIR_PATH,
        llvmir_file2ret,
        LLC_file2ret,
        LLC_globalisel,
        ROOT_DIR_PATH,
        TIMEOUT,
        "LLC-globalISel",
        ".s",
    )

    # extract basic block
    extract_basic_block_folder(
        MLIR_OPTIMIZED_DIR_PATH, MLIR_bb0_VEIR_DIR_PATH, LOGS_DIR_PATH
    )

    LAKE_file2ret_opt = dict()
    VEIROPT_BIN = f"{ROOT_DIR_PATH}/veir/.lake/build/bin/veir-opt"
    # veir-opt multithreaded
    VEIR(
        jobs,
        LAKE_file2ret_opt,
        MLIR_bb0_VEIR_DIR_PATH,
        VEIR_ASM_DIR_PATH,
        LOGS_DIR_PATH,
        ROOT_DIR_PATH,
        VEIROPT_BIN,
        TIMEOUT,
    )

    # veir2mir
    VEIR2MIR_BIN = f"{ROOT_DIR_PATH}/veir/.lake/build/bin/veir2mir"
    veir2mir_file2ret = dict()
    VEIR2MIR(
        VEIR_ASM_DIR_PATH,
        VEIR_MIR_DIR_PATH,
        LOGS_DIR_PATH,
        LAKE_file2ret_opt,
        veir2mir_file2ret,
        VEIR2MIR_BIN,
        ROOT_DIR_PATH,
        TIMEOUT,
    )

    # llc regalloc
    veir_regalloc_file2ret = dict()
    apply_lowering_to_folder(
        VEIR_MIR_DIR_PATH,
        VEIR_REGALLOC_ASM_DIR_PATH,
        LOGS_DIR_PATH,
        veir2mir_file2ret,
        veir_regalloc_file2ret,
        LLC_mir_regalloc,
        ROOT_DIR_PATH,
        TIMEOUT,
        "LLC-MIR-regalloc",
        ".s",
    )

    return cleanup_empty_logs(LOGS_DIR_PATH)


def main():
    parser = argparse.ArgumentParser(
        prog="generate",
        description="Generate a new set of benchmarks in all the representations, from MLIR to RISCV assembly.",
    )

    parser.add_argument(
        "-n", "--num", type=int, default=100, help="Number of benchmarks to generate. "
    )

    parser.add_argument(
        "-j", "--jobs", type=int, default=1, help="Parallel jobs for all benchmarks"
    )

    parser.add_argument(
        "-s",
        "--seed",
        type=int,
        default=0,
        help="PRNG seed for the random inputs of the veir-interpret filter",
    )

    args = parser.parse_args()

    code = generate_benchmarks(args.num, args.jobs, args.seed)

    sys.exit(code)


if __name__ == "__main__":
    main()
