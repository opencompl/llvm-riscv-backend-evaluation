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

from utils.generate import (
    setup_benchmarking_directories,
    cleanup_empty_logs,
    MLIR_opt,
    LLVM_opt,
    MLIR_to_LLVM,
    LLVM_to_MLIR,
    LLC_selectiondag,
    LLC_globalisel,
    VEIR,
    LLC_mir_regalloc,
    replace_hyphens_in_variables,
    extract,
    sanitize,
    rewrite_value_attr_to_immediate,
    rename_numeric_block_labels,
    XDSL_create_func,
    XDSL_regalloc,
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

XDSL_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/XDSL_ASM/"

XDSL_FUNC_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/XDSL_FUNC/"

LOGS_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/logs/"


AUTOGEN_DIR_PATHS = [
    LLVM_DIR_PATH,
    LLVMIR_DIR_PATH,
    MLIR_single_DIR_PATH,
    MLIR_bb0_VEIR_DIR_PATH,
    LLC_ASM_selectiondag_DIR_PATH,
    LLC_ASM_globalisel_DIR_PATH,
    XDSL_FUNC_ASM_DIR_PATH,
    VEIR_ASM_DIR_PATH,
    VEIR_MIR_DIR_PATH,
    VEIR_REGALLOC_ASM_DIR_PATH,
    XDSL_ASM_DIR_PATH,
    LOGS_DIR_PATH,
    LLVM_OPTIMIZED_DIR_PATH,
    MLIR_OPTIMIZED_DIR_PATH,
]


def generate_benchmarks(num, jobs):
    setup_benchmarking_directories(AUTOGEN_DIR_PATHS)

    # Extract single MLIR blocks
    for file in os.listdir(MLIR_multi_DIR_PATH):
        input_file = os.path.join(MLIR_multi_DIR_PATH, file)
        replace_hyphens_in_variables(input_file)
        extract(input_file, MLIR_single_DIR_PATH, num)

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

    # rename numeric block labels and sanitize inputs
    for filename in os.listdir(VEIR_ASM_DIR_PATH):
        input_file = os.path.join(VEIR_ASM_DIR_PATH, filename)
        rename_numeric_block_labels(input_file)
        sanitize(input_file)
        rewrite_value_attr_to_immediate(input_file)

    # XDSL parsing and wrapping in func.func
    XDSL_create_func_file2ret_opt = dict()
    apply_lowering_to_folder(
        VEIR_ASM_DIR_PATH,
        XDSL_FUNC_ASM_DIR_PATH,
        LOGS_DIR_PATH,
        LAKE_file2ret_opt,
        XDSL_create_func_file2ret_opt,
        XDSL_create_func,
        ROOT_DIR_PATH,
        TIMEOUT,
        "XDSL-create-func",
        ".mlir",
    )

    # register-allocation with XDSL
    XDSL_reg_alloc_file2ret_opt = dict()
    apply_lowering_to_folder(
        XDSL_FUNC_ASM_DIR_PATH,
        XDSL_ASM_DIR_PATH,
        LOGS_DIR_PATH,
        XDSL_create_func_file2ret_opt,
        XDSL_reg_alloc_file2ret_opt,
        XDSL_regalloc,
        ROOT_DIR_PATH,
        TIMEOUT,
        "XDSL-regalloc",
        ".mlir",
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

    args = parser.parse_args()

    code = generate_benchmarks(args.num, args.jobs)

    sys.exit(code)


if __name__ == "__main__":
    main()
