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

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "benchmarks"))

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
    veir2mir_step,
    LLC_mir_regalloc,
    extract_basic_block,
    replace_bool_constants,
    replace_hyphens_in_variables,
    extract,
    sanitize,
    rewrite_value_attr_to_immediate,
    rename_numeric_block_labels,
    XDSL_create_func,
    XDSL_regalloc,
)


ROOT_DIR_PATH = (
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode("utf-8")
    .strip()
)

TIMEOUT = 1800

LLC_GLOBALISEL_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/LLC_GlobalISel_ASM/"

LLVM_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/LLVM/"
LLVMIR_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/LLVMIR/"

MLIR_bb0_VEIR_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/MLIR_bb0_veir/"
MLIR_single_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/MLIR_single/"
MLIR_multi_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/MLIR_multi/"
isolated_instructions_DIR_PATH = (
    f"{ROOT_DIR_PATH}/compare-lowering-patterns/isolated_instructions/"
)

LLC_ASM_selectiondag_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/LLC_ASM_selectiondag/"

LLC_ASM_globalisel_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/LLC_ASM_globalisel/"
VEIR_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/VEIR_ASM/"
VEIR_MIR_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/VEIR_MIR/"
VEIR_REGALLOC_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/VEIR_REGALLOC_ASM/"

VEIR2MIR_BIN = f"{ROOT_DIR_PATH}/veir/.lake/build/bin/veir2mir"

LLVM_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/LLVM_preopt/"

MLIR_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/MLIR_preopt/"

XDSL_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/XDSL_ASM/"

XDSL_FUNC_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/XDSL_FUNC/"

LOGS_DIR_PATH = f"{ROOT_DIR_PATH}/benchmarks/logs/"


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


def generate_benchmarks(num, jobs, llvm_opt, compare_lowering_patterns=False):
    setup_benchmarking_directories(AUTOGEN_DIR_PATHS)

    if compare_lowering_patterns:
        print(
            f"Using instruction-specific files from: {isolated_instructions_DIR_PATH}"
        )
        extract(
            isolated_instructions_DIR_PATH,
            MLIR_single_DIR_PATH,
            num,
            compare_lowering_patterns,
        )
    else:
        # extract mlir blocks and put them all in separate files
        # for each file with programs of a certain size
        for file in os.listdir(MLIR_multi_DIR_PATH):
            input_file = os.path.join(MLIR_multi_DIR_PATH, file)
            replace_hyphens_in_variables(input_file)
            extract(input_file, MLIR_single_DIR_PATH, num, compare_lowering_patterns)

    MLIR_opt_file2ret = dict()
    idx = 0
    # convert `.mlir` files into `.ll` files
    for filename in os.listdir(MLIR_single_DIR_PATH):
        input_file = os.path.join(MLIR_single_DIR_PATH, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(LLVM_DIR_PATH, basename + ".ll")
        log_file = open(os.path.join(LOGS_DIR_PATH, basename + "_mlir_opt.log"), "w")
        MLIR_opt(
            input_file, output_file, log_file, MLIR_opt_file2ret, ROOT_DIR_PATH, TIMEOUT
        )
        percentage = (float(idx) / float(len(os.listdir(MLIR_single_DIR_PATH)))) * 100
        idx += 1
        print(f"translating to LLVM with mlir-opt: {percentage:.2f}%")

    MLIR_translate_file2ret = dict()
    idx = 0
    # Run mlir-translate and convert LLVM dialect MLIR into LLVMIR
    for filename in os.listdir(LLVM_DIR_PATH):
        input_file = os.path.join(LLVM_DIR_PATH, filename)
        # only run the lowering if the previous pass was successful:
        if MLIR_opt_file2ret[input_file] == 0:
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(LLVMIR_DIR_PATH, basename + ".ll")
            log_file = open(
                os.path.join(LOGS_DIR_PATH, basename + "_mlir_translate.log"), "w"
            )
            MLIR_to_LLVM(
                input_file,
                output_file,
                log_file,
                MLIR_translate_file2ret,
                ROOT_DIR_PATH,
                TIMEOUT,
            )
        idx += 1
        percentage = (float(idx) / float(len(MLIR_opt_file2ret))) * 100
        print(f"translating to LLVMIR with mlir-translate: {percentage:.2f}%")

    LLVM_preopt_file2ret = dict()
    idx = 0
    # preoptimize `.ll` files with opt -O2
    for filename in os.listdir(LLVMIR_DIR_PATH):
        input_file = os.path.join(LLVMIR_DIR_PATH, filename)
        # only run the lowering if the previous pass was successful:
        if MLIR_translate_file2ret[input_file] == 0:
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(LLVM_OPTIMIZED_DIR_PATH, basename + ".ll")
            log_file = open(
                os.path.join(LOGS_DIR_PATH, basename + "_llvm_preopt.log"), "w"
            )
            LLVM_opt(
                input_file,
                output_file,
                log_file,
                LLVM_preopt_file2ret,
                ROOT_DIR_PATH,
                TIMEOUT,
            )
        idx += 1
        percentage = (float(idx) / float(len(MLIR_translate_file2ret))) * 100
        print(f"preoptimizing with opt -O2: {percentage:.2f}%")

    MLIR_preopt_file2ret = dict()
    idx = 0
    # Import optimized LLVM IR back to MLIR for VeIR bb0 extraction
    for filename in os.listdir(LLVM_OPTIMIZED_DIR_PATH):
        input_file = os.path.join(LLVM_OPTIMIZED_DIR_PATH, filename)
        # only run the lowering if the previous pass was successful:
        if LLVM_preopt_file2ret[input_file] == 0:
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(MLIR_OPTIMIZED_DIR_PATH, basename + ".mlir")
            log_file = open(
                os.path.join(LOGS_DIR_PATH, basename + "_import_llvm.log"), "w"
            )
            LLVM_to_MLIR(
                input_file,
                output_file,
                log_file,
                MLIR_preopt_file2ret,
                ROOT_DIR_PATH,
                TIMEOUT,
            )
        idx += 1
        percentage = (float(idx) / float(len(LLVM_preopt_file2ret))) * 100
        print(f"importing optimized LLVM IR to MLIR: {percentage:.2f}%")

    LLC_file2ret = dict()
    idx = 0
    # Use llc with `selectionDAG` to compile preoptimized LLVMIR into RISCV
    for filename in os.listdir(LLVM_OPTIMIZED_DIR_PATH):
        input_file = os.path.join(LLVM_OPTIMIZED_DIR_PATH, filename)
        # only run the lowering if the previous pass was successful:
        if LLVM_preopt_file2ret[input_file] == 0:
            basename, _ = os.path.splitext(filename)

            if llvm_opt == "default":
                output_file = os.path.join(
                    LLC_ASM_selectiondag_DIR_PATH, basename + ".s"
                )
                log_file = open(
                    os.path.join(LOGS_DIR_PATH, basename + "_selectiondag_llc.log"),
                    "w",
                )
                LLC_selectiondag(
                    input_file,
                    output_file,
                    log_file,
                    LLC_file2ret,
                    "",
                    ROOT_DIR_PATH,
                    TIMEOUT,
                )
            else:
                output_file = os.path.join(
                    LLC_ASM_selectiondag_DIR_PATH, basename + "_" + llvm_opt + ".s"
                )
                log_file = open(
                    os.path.join(
                        LOGS_DIR_PATH,
                        basename + "_selectiondag_llc" + "_" + llvm_opt + ".log",
                    ),
                    "w",
                )
                LLC_selectiondag(
                    input_file,
                    output_file,
                    log_file,
                    LLC_file2ret,
                    "-" + llvm_opt,
                    ROOT_DIR_PATH,
                    TIMEOUT,
                )
        percentage = (float(idx) / float(len(LLVM_preopt_file2ret))) * 100
        idx += 1
        print(f"compiling with llc (selectionDAG {llvm_opt}): {percentage:.2f}%")

    LLC_GLOBALISEL_file2ret = dict()
    idx = 0
    # Use llc with `GlobalISel` to compile preoptimized LLVMIR into RISCV
    for filename in os.listdir(LLVM_OPTIMIZED_DIR_PATH):
        input_file = os.path.join(LLVM_OPTIMIZED_DIR_PATH, filename)
        # only run the lowering if the previous pass was successful:
        if LLVM_preopt_file2ret[input_file] == 0:  # previous pass succeded
            if llvm_opt == "default":
                basename, _ = os.path.splitext(filename)
                output_file = os.path.join(LLC_ASM_globalisel_DIR_PATH, basename + ".s")
                log_file = open(
                    os.path.join(LOGS_DIR_PATH, basename + "_globalisel_llc.log"),
                    "w",
                )
                LLC_globalisel(
                    input_file,
                    output_file,
                    log_file,
                    LLC_GLOBALISEL_file2ret,
                    "",
                    ROOT_DIR_PATH,
                    TIMEOUT,
                )
            else:
                basename, _ = os.path.splitext(filename)
                output_file = os.path.join(
                    LLC_ASM_globalisel_DIR_PATH, basename + "_" + llvm_opt + ".s"
                )
                log_file = open(
                    os.path.join(
                        LOGS_DIR_PATH,
                        basename + "_globalisel_llc" + "_" + llvm_opt + ".log",
                    ),
                    "w",
                )
                LLC_globalisel(
                    input_file,
                    output_file,
                    log_file,
                    LLC_GLOBALISEL_file2ret,
                    "-" + llvm_opt,
                    ROOT_DIR_PATH,
                    TIMEOUT,
                )
        percentage = (float(idx) / float(len(LLVM_preopt_file2ret))) * 100
        idx += 1
        print(f"compiling with llc (globalISel {llvm_opt}): {percentage:.2f}%")

    # Extract bb0 from optimized MLIR for VeIR
    idx = 0
    for filename in os.listdir(MLIR_OPTIMIZED_DIR_PATH):
        input_file = os.path.join(MLIR_OPTIMIZED_DIR_PATH, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(MLIR_bb0_VEIR_DIR_PATH, basename + ".mlir")
        log_file = open(os.path.join(LOGS_DIR_PATH, basename + "_bb0_extract.log"), "w")
        log_file_veIR = open(
            os.path.join(LOGS_DIR_PATH, basename + "_bb0_extract_veIR.log"), "w"
        )
        extract_basic_block(input_file, output_file, log_file_veIR)
        idx += 1
        percentage = (
            float(idx) / float(len(os.listdir(MLIR_OPTIMIZED_DIR_PATH)))
        ) * 100
        print(f"extracting the first basic block: {percentage:.2f}%")

    for filename in os.listdir(MLIR_bb0_VEIR_DIR_PATH):
        replace_bool_constants(os.path.join(MLIR_bb0_VEIR_DIR_PATH, filename))

    # LAKE_file2ret = dict()
    # # Run the lean pass in parallel
    # LAKE_compile_riscv64(jobs, LAKE_file2ret)

    LAKE_file2ret_opt = dict()
    # Run the optimized lean pass in parallel
    VEIR(
        jobs,
        LAKE_file2ret_opt,
        MLIR_bb0_VEIR_DIR_PATH,
        VEIR_ASM_DIR_PATH,
        LOGS_DIR_PATH,
        ROOT_DIR_PATH,
        TIMEOUT,
    )

    veir2mir_file2ret = dict()
    idx = 0
    for filename in os.listdir(VEIR_ASM_DIR_PATH):
        input_file = os.path.join(VEIR_ASM_DIR_PATH, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(VEIR_MIR_DIR_PATH, basename + ".mir")
        log_file = open(os.path.join(LOGS_DIR_PATH, basename + "_veir2mir.log"), "w")
        veir2mir_step(
            input_file,
            output_file,
            log_file,
            veir2mir_file2ret,
            VEIR2MIR_BIN,
            ROOT_DIR_PATH,
            TIMEOUT,
        )
        idx += 1
        percentage = (float(idx) / float(len(os.listdir(VEIR_ASM_DIR_PATH)))) * 100
        print(f"converting to pre-RA MIR with veir2mir: {percentage:.2f}%")

    veir_regalloc_file2ret = dict()
    idx = 0
    for filename in os.listdir(VEIR_MIR_DIR_PATH):
        input_file = os.path.join(VEIR_MIR_DIR_PATH, filename)
        if veir2mir_file2ret.get(input_file) == 0:
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(VEIR_REGALLOC_ASM_DIR_PATH, basename + ".s")
            log_file = open(
                os.path.join(LOGS_DIR_PATH, basename + "_veir_regalloc.log"), "w"
            )
            LLC_mir_regalloc(
                input_file,
                output_file,
                log_file,
                veir_regalloc_file2ret,
                ROOT_DIR_PATH,
                TIMEOUT,
            )
        idx += 1
        percentage = (float(idx) / float(len(veir2mir_file2ret))) * 100
        print(f"register allocating veir MIR with llc: {percentage:.2f}%")

    for filename in os.listdir(VEIR_ASM_DIR_PATH):
        input_file = os.path.join(VEIR_ASM_DIR_PATH, filename)
        sanitize(input_file)
        rewrite_value_attr_to_immediate(input_file)

    XDSL_create_func_file2ret_opt = dict()
    idx = 0
    # Create `func.func`
    for filename in os.listdir(VEIR_ASM_DIR_PATH):
        input_file = os.path.join(VEIR_ASM_DIR_PATH, filename)
        if LAKE_file2ret_opt[input_file] == 0:
            rename_numeric_block_labels(input_file)
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(XDSL_FUNC_ASM_DIR_PATH, basename + ".mlir")
            log_file = open(
                os.path.join(LOGS_DIR_PATH, basename + "_xdsl_create_func_opt.log"), "w"
            )
            XDSL_create_func(
                input_file,
                output_file,
                log_file,
                XDSL_create_func_file2ret_opt,
                ROOT_DIR_PATH,
                TIMEOUT,
            )
        idx += 1
        percentage = (float(idx) / float(len(LAKE_file2ret_opt))) * 100
        print(f"creating func.func module (opt): {percentage:.2f}%")

    # XDSL_reg_alloc_file2ret = dict()
    # idx = 0
    # # Register allocation with XDSL
    # for filename in os.listdir(XDSL_FUNC_ASM_DIR_PATH):
    #     input_file = os.path.join(XDSL_FUNC_ASM_DIR_PATH, filename)
    #     if XDSL_create_func_file2ret[input_file] == 0:
    #         basename, _ = os.path.splitext(filename)
    #         output_file = os.path.join(XDSL_ASM_DIR_PATH, basename + ".mlir")
    #         log_file = open(
    #             os.path.join(LOGS_DIR_PATH, basename + "_xdsl_reg_alloc.log"), "w"
    #         )
    #         XDSL_reg_alloc(input_file, output_file, log_file, XDSL_reg_alloc_file2ret)
    #     idx += 1
    #     percentage = (float(idx) / float(len(XDSL_create_func_file2ret))) * 100
    #     print(f"allocating registers and outputting assembly: {percentage:.2f}%")

    XDSL_reg_alloc_file2ret_opt = dict()
    idx = 0
    # Register allocation with XDSL
    for filename in os.listdir(XDSL_FUNC_ASM_DIR_PATH):
        input_file = os.path.join(XDSL_FUNC_ASM_DIR_PATH, filename)
        if XDSL_create_func_file2ret_opt[input_file] == 0:
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(XDSL_ASM_DIR_PATH, basename + ".mlir")
            log_file = open(
                os.path.join(LOGS_DIR_PATH, basename + "_xdsl_reg_alloc.log"), "w"
            )
            XDSL_regalloc(
                input_file, output_file, log_file, XDSL_reg_alloc_file2ret_opt
            )
        idx += 1
        percentage = (float(idx) / float(len(XDSL_create_func_file2ret_opt))) * 100
        print(f"allocating registers and outputting assembly (opt): {percentage:.2f}%")

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
        "-llvm",
        "--llvm_opt",
        help="Optimization level for LLVM.",
        choices=["O3", "O2", "O1", "O0", "default", "all"],
        default="default",
    )

    parser.add_argument(
        "-l",
        "--instruction_lowering",
        help="Create files for instruction lowering patterns comparison.",
        action="store_true",
        default=False,
    )

    args = parser.parse_args()

    code = generate_benchmarks(
        args.num, args.jobs, args.llvm_opt, args.instruction_lowering
    )

    sys.exit(code)


if __name__ == "__main__":
    main()
