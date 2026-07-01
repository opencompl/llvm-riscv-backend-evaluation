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
from pathlib import Path
from utils.generate import strip_target_info, vcc_emit_mlir

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
)


ROOT_DIR_PATH = Path(
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"]).decode().strip()
)

TIMEOUT = 1800

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
VEIR_MIR_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/VEIR_MIR/"
VEIR_REGALLOC_ASM_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/VEIR_REGALLOC_ASM/"

LLVM_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/LLVM_preopt/"

MLIR_OPTIMIZED_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/MLIR_preopt/"

LOGS_DIR_PATH = f"{ROOT_DIR_PATH}/real-benchmarks/logs/"

AUTOGEN_DIR_PATHS = [
    MLIR_init_DIR_PATH,
    LLVM_DIR_PATH,
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

BENCHMARKS = [
    ROOT_DIR_PATH / "veir" / "Test" / "Vcc" / "fastntt.c",
]


def main():

    setup_benchmarking_directories(AUTOGEN_DIR_PATHS)

    vcc_file2ret = dict()
    for src in BENCHMARKS:
        output_file = os.path.join(MLIR_init_DIR_PATH, src.stem + ".mlir")
        log_file = open(os.path.join(LOGS_DIR_PATH, src.stem + "_vcc.log"), "w")
        vcc_emit_mlir(
            str(src), output_file, log_file, vcc_file2ret, ROOT_DIR_PATH, TIMEOUT
        )
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
            output_file = os.path.join(LLC_ASM_selectiondag_DIR_PATH, basename + ".s")
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
    VEIR(
        1,
        LAKE_file2ret_opt,
        MLIR_bb0_VEIR_DIR_PATH,
        VEIR_ASM_DIR_PATH,
        LOGS_DIR_PATH,
        ROOT_DIR_PATH,
    )

    veir2mir_file2ret = dict()
    idx = 0
    for filename in os.listdir(VEIR_ASM_DIR_PATH):
        input_file = os.path.join(VEIR_ASM_DIR_PATH, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(VEIR_MIR_DIR_PATH, basename + ".mir")
        log_file = open(os.path.join(LOGS_DIR_PATH, basename + "_veir2mir.log"), "w")
        veir2mir_step(input_file, output_file, log_file, veir2mir_file2ret)
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
            LLC_mir_regalloc(input_file, output_file, log_file, veir_regalloc_file2ret)
        idx += 1
        percentage = (float(idx) / float(len(veir2mir_file2ret))) * 100
        print(f"register allocating veir MIR with llc: {percentage:.2f}%")

    e = cleanup_empty_logs(LOGS_DIR_PATH)

    sys.exit(e)


if __name__ == "__main__":
    main()
