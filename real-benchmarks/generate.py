#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.12"
# dependencies = ["xdsl", "utils"]
#
# [tool.uv.sources]
# xdsl = { path = "../xdsl" }
# utils = { path = "../utils" }
# ///

import os
import subprocess
import sys
import argparse
from pathlib import Path

from utils.generate import (
    setup_benchmarking_directories,
    cleanup_empty_logs,
    LLVM_opt,
    MLIR_to_LLVM,
    LLVM_to_MLIR,
    LLC_selectiondag,
    LLC_globalisel,
    VEIR,
    LLC_mir_regalloc,
    strip_target_info,
    vcc_emit_mlir,
    apply_lowering_to_folder,
    extract_basic_block_folder,
    VEIR2MIR,
)


ROOT_DIR_PATH = Path(
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"]).decode().strip()
)

TIMEOUT = 1800


LLVMIR_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLVMIR/"

MLIR_bb0_VEIR_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/MLIR_bb0_veir/"
MLIR_init_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/MLIR_init/"

LLC_ASM_selectiondag_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLC_ASM_selectiondag/"

LLC_ASM_globalisel_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLC_ASM_globalisel/"
VEIR_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/VEIR_ASM/"
VEIR_MIR_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/VEIR_MIR/"
VEIR_REGALLOC_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/VEIR_REGALLOC_ASM/"

LLVM_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLVM_preopt/"

MLIR_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/MLIR_preopt/"

LOGS_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/logs/"

AUTOGEN_DIR_PATHS = [
    MLIR_init_DIR_PATH,
    LLVMIR_DIR_PATH,
    MLIR_bb0_VEIR_DIR_PATH,
    LLC_ASM_selectiondag_DIR_PATH,
    LLC_ASM_globalisel_DIR_PATH,
    VEIR_ASM_DIR_PATH,
    VEIR_MIR_DIR_PATH,
    VEIR_REGALLOC_ASM_DIR_PATH,
    LOGS_DIR_PATH,
    LLVM_OPTIMIZED_DIR_PATH,
    MLIR_OPTIMIZED_DIR_PATH,
]

VEIR2MIR_BIN = f"{ROOT_DIR_PATH}/veir/.lake/build/bin/veir2mir"

BENCHMARKS = [
    ROOT_DIR_PATH / "veir" / "Test" / "Vcc" / "fastntt.c",
]


def generate_benchmarks(jobs):

    setup_benchmarking_directories(AUTOGEN_DIR_PATHS)

    idx = 0
    # VCC to MLIR
    vcc_file2ret = dict()
    for src in BENCHMARKS:
        output_file = os.path.join(MLIR_init_DIR_PATH, src.stem + ".mlir")
        log_file = open(os.path.join(LOGS_DIR_PATH, src.stem + "_vcc.log"), "w")
        vcc_emit_mlir(
            str(src), output_file, log_file, vcc_file2ret, ROOT_DIR_PATH, TIMEOUT
        )
        idx += 1
        percentage = (float(idx) / float(len(BENCHMARKS))) * 100
        print(f"[VCC]: {percentage:.2f}%")

    # MLIR to LLVM, post-process to remove target info such that LLC can lower to assembly.
    MLIR_translate_file2ret = dict()
    apply_lowering_to_folder(
        MLIR_init_DIR_PATH,
        LLVMIR_DIR_PATH,
        LOGS_DIR_PATH,
        vcc_file2ret,
        MLIR_translate_file2ret,
        MLIR_to_LLVM,
        ROOT_DIR_PATH,
        TIMEOUT,
        "MLIR-translate",
        ".ll",
        strip_target_info,
    )

    # LLVM opt
    llvmir_file2ret = dict()
    apply_lowering_to_folder(
        LLVMIR_DIR_PATH,
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

    # LLVM IR to MLIR to extract bb0
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
        prog="generate-real",
        description="Lower real benchmarks across all pipelines.",
    )

    parser.add_argument(
        "-j", "--jobs", type=int, default=1, help="Parallel jobs for all benchmarks"
    )

    args = parser.parse_args()

    e = generate_benchmarks(args.jobs)

    sys.exit(e)


if __name__ == "__main__":
    main()
