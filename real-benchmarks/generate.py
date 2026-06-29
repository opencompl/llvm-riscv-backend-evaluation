#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.12"
# dependencies = ["xdsl"]
#
# [tool.uv.sources]
# xdsl = { path = "../xdsl" }
# ///
import importlib.util
import os
import shutil
import subprocess
import sys
from pathlib import Path
import argparse

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'benchmarks'))

from generate import (
    setup_benchmarking_directories,
    cleanup_empty_logs,
    run_command,
    MLIR_opt,
    LLVM_opt,
    MLIR_to_LLVM,
    LLVM_to_MLIR,
    LLC_selectiondag,
    LLC_globalisel,
    VEIR,
    XDSL_create_func,
    XDSL_regalloc,
    sanitize,
    rewrite_value_attr_to_immediate,
    extract_basic_block,
    rename_numeric_block_labels,
    replace_bool_constants,
    replace_hyphens_in_variables,
)



ROOT_DIR_PATH = Path(
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode()
    .strip()
)

TIMEOUT_SEC = 1800

LLC_GLOBALISEL_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLC_GlobalISel_ASM/"

LLVM_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLVM/"
LLVMIR_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLVMIR/"

MLIR_bb0_VEIR_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/MLIR_bb0_veir/"
MLIR_init_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/MLIR_init/"
isolated_instructions_DIR_PATH = (
    f"{ROOT_DIR_PATH}/compare-lowering-patterns/isolated_instructions/"
)

LLC_ASM_selectiondag_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLC_ASM_selectiondag/"

LLC_ASM_globalisel_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLC_ASM_globalisel/"
VEIR_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/VEIR_ASM/"

LLVM_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLVM_preopt/"

MLIR_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/MLIR_preopt/"

XDSL_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/XDSL_ASM/"

XDSL_FUNC_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/XDSL_FUNC/"

LOGS_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/logs/"

AUTOGEN_DIR_PATHS = [
    MLIR_init_DIR_PATH,
    LLVM_DIR_PATH,
    LLVMIR_DIR_PATH,
    MLIR_bb0_VEIR_DIR_PATH,
    LLC_ASM_selectiondag_DIR_PATH,
    LLC_ASM_globalisel_DIR_PATH,
    XDSL_FUNC_ASM_DIR_PATH,
    VEIR_ASM_DIR_PATH,
    XDSL_ASM_DIR_PATH,
    LOGS_DIR_PATH,
    LLVM_OPTIMIZED_DIR_PATH,
    MLIR_OPTIMIZED_DIR_PATH,
]

BENCHMARKS = [
    ROOT_DIR_PATH / "veir" / "Test" / "Vcc" / "fastntt.c",
]


def strip_target_info(file_path):
    """Remove host target info from an LLVMIR file.

    mlir-translate embeds the host (x86-64) triple and CPU/feature attributes,
    which makes llc refuse to compile for RISC-V even when -march=riscv64 is
    passed. We strip the module-level triple/datalayout lines and the
    per-function target-cpu/target-features/tune-cpu attribute pairs.
    """
    import re
    _target_attr = re.compile(r'\s*"(?:target-cpu|target-features|tune-cpu)"="[^"]*"')

    with open(file_path, "r") as f:
        lines = f.readlines()
    with open(file_path, "w") as f:
        for line in lines:
            if line.startswith("target triple") or line.startswith("target datalayout"):
                continue
            f.write(_target_attr.sub("", line))


def vcc_emit_mlir(input_file, output_file, log_file, pass_dict):
    vcc = ROOT_DIR_PATH / "veir" / "Tools" / "vcc"
    cmd = f"{vcc} --emit-mlir -O {input_file} -o {output_file}"
    ret_code = run_command(cmd, log_file)
    pass_dict[output_file] = ret_code


def generate_real_benchmarks(llvm_o2=False):
    setup_benchmarking_directories(AUTOGEN_DIR_PATHS)

    vcc_file2ret = dict()
    for src in BENCHMARKS:
        output_file = os.path.join(MLIR_init_DIR_PATH, src.stem + ".mlir")
        log_file = open(os.path.join(LOGS_DIR_PATH, src.stem + "_vcc.log"), "w")
        vcc_emit_mlir(str(src), output_file, log_file, vcc_file2ret)
        print(f"compiled {src.name} with vcc")

    MLIR_opt_file2ret = dict()
    idx = 0
    # convert `.mlir` files into `.ll` files
    for filename in os.listdir(MLIR_init_DIR_PATH):
        input_file = os.path.join(MLIR_init_DIR_PATH, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(LLVM_DIR_PATH, basename + ".ll")
        log_file = open(os.path.join(LOGS_DIR_PATH, basename + "_mlir_opt.log"), "w")
        MLIR_opt(input_file, output_file, log_file, MLIR_opt_file2ret)
        percentage = (float(idx) / float(len(os.listdir(MLIR_init_DIR_PATH)))) * 100
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
            MLIR_to_LLVM(input_file, output_file, log_file, MLIR_translate_file2ret)
            if MLIR_translate_file2ret.get(output_file) == 0:
                strip_target_info(output_file)
        idx += 1
        percentage = (float(idx) / float(len(MLIR_opt_file2ret))) * 100
        print(f"translating to LLVMIR with mlir-translate: {percentage:.2f}%")

    if llvm_o2:
        llvmir_for_llc = LLVM_OPTIMIZED_DIR_PATH
        llvmir_file2ret = dict()
        idx = 0
        for filename in os.listdir(LLVMIR_DIR_PATH):
            input_file = os.path.join(LLVMIR_DIR_PATH, filename)
            if MLIR_translate_file2ret[input_file] == 0:
                basename, _ = os.path.splitext(filename)
                output_file = os.path.join(LLVM_OPTIMIZED_DIR_PATH, basename + ".ll")
                log_file = open(
                    os.path.join(LOGS_DIR_PATH, basename + "_llvm_preopt.log"), "w"
                )
                LLVM_opt(input_file, output_file, log_file, llvmir_file2ret)
            idx += 1
            percentage = (float(idx) / float(len(MLIR_translate_file2ret))) * 100
            print(f"preoptimizing with opt -O2: {percentage:.2f}%")
    else:
        llvmir_for_llc = LLVMIR_DIR_PATH
        llvmir_file2ret = MLIR_translate_file2ret

    MLIR_preopt_file2ret = dict()
    idx = 0
    # Import LLVMIR back to MLIR for VeIR bb0 extraction
    for filename in os.listdir(llvmir_for_llc):
        input_file = os.path.join(llvmir_for_llc, filename)
        # only run the lowering if the previous pass was successful:
        if llvmir_file2ret[input_file] == 0:
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(MLIR_OPTIMIZED_DIR_PATH, basename + ".mlir")
            log_file = open(
                os.path.join(LOGS_DIR_PATH, basename + "_import_llvm.log"), "w"
            )
            LLVM_to_MLIR(input_file, output_file, log_file, MLIR_preopt_file2ret)
        idx += 1
        percentage = (float(idx) / float(len(llvmir_file2ret))) * 100
        print(f"importing LLVM IR to MLIR: {percentage:.2f}%")

    LLC_file2ret = dict()
    idx = 0
    # Use llc with `selectionDAG` to compile LLVMIR into RISCV
    for filename in os.listdir(llvmir_for_llc):
        input_file = os.path.join(llvmir_for_llc, filename)
        # only run the lowering if the previous pass was successful:
        if llvmir_file2ret[input_file] == 0:
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(
                LLC_ASM_selectiondag_DIR_PATH, basename + ".s"
            )
            log_file = open(
                os.path.join(LOGS_DIR_PATH, basename + "_selectiondag_llc.log"),
                "w",
            )
            LLC_selectiondag(input_file, output_file, log_file, LLC_file2ret, "")
        percentage = (float(idx) / float(len(llvmir_file2ret))) * 100
        idx += 1
        print(f"compiling with llc (selectionDAG): {percentage:.2f}%")

    LLC_GLOBALISEL_file2ret = dict()
    idx = 0
    # Use llc with `GlobalISel` to compile LLVMIR into RISCV
    for filename in os.listdir(llvmir_for_llc):
        input_file = os.path.join(llvmir_for_llc, filename)
        # only run the lowering if the previous pass was successful:
        if llvmir_file2ret[input_file] == 0:  # previous pass succeded
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(LLC_ASM_globalisel_DIR_PATH, basename + ".s")
            log_file = open(
                os.path.join(LOGS_DIR_PATH, basename + "_globalisel_llc.log"),
                "w",
            )
            LLC_globalisel(
                input_file, output_file, log_file, LLC_GLOBALISEL_file2ret, ""
            )
            
        percentage = (float(idx) / float(len(llvmir_file2ret))) * 100
        idx += 1
        print(f"compiling with llc (globalISel): {percentage:.2f}%")

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
    VEIR(1, LAKE_file2ret_opt, MLIR_bb0_VEIR_DIR_PATH, VEIR_ASM_DIR_PATH, LOGS_DIR_PATH, ROOT_DIR_PATH)

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
                input_file, output_file, log_file, XDSL_create_func_file2ret_opt
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

    cleanup_empty_logs(LOGS_DIR_PATH)



def main():
    parser = argparse.ArgumentParser(
        prog="generate",
        description="Generate a new set of benchmarks in all the representations, from MLIR to RISCV assembly.",
    )
    parser.add_argument(
        "--llvm-O2",
        dest="llvm_o2",
        action="store_true",
        default=False,
        help="pre-optimize LLVMIR with opt -O2 before LLC and VeIR bb0 extraction (default: off)",
    )
    args = parser.parse_args()

    generate_real_benchmarks(llvm_o2=args.llvm_o2)


if __name__ == "__main__":
    main()
