#!/usr/bin/env python3

import os
import shutil
import subprocess

ROOT_DIR = (
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode("utf-8")
    .strip()
)
TIMEOUT = 1800  # seconds

LLC_ASM_globalisel_DIR = (
    f"{ROOT_DIR}/benchmarks/LLC_ASM_globalisel/"
)
LLC_ASM_selectiondag_DIR = (
    f"{ROOT_DIR}/benchmarks/LLC_ASM_selectiondag/"
)
LLC_ASM_DIR = f"{ROOT_DIR}/benchmarks/LLC_ASM/"
XDSL_ASM_DIR = f"{ROOT_DIR}/benchmarks/XDSL_ASM/"
VEIR_REGALLOC_ASM_DIR = f"{ROOT_DIR}/benchmarks/VEIR_REGALLOC_ASM/"
MCA_VEIR_XDSL_DIR = f"{ROOT_DIR}/mca-analysis/results/VEIR_xdsl/"
MCA_VEIR_LLVM_DIR = f"{ROOT_DIR}/mca-analysis/results/VEIR_llvm/"

MCA_LLVM_globalisel_DIR = f"{ROOT_DIR}/mca-analysis/results/LLVM_globalisel/"
MCA_LLVM_selectiondag_DIR = f"{ROOT_DIR}/mca-analysis/results/LLVM_selectiondag/"
LOGS_DIR = f"{ROOT_DIR}/mca-analysis/results/logs/"


AUTOGEN_DIR_PATHS = [
    MCA_VEIR_XDSL_DIR,
    MCA_VEIR_LLVM_DIR,
    MCA_LLVM_globalisel_DIR,
    MCA_LLVM_selectiondag_DIR,
    LOGS_DIR,
]



def mca_analysis(input_file, output_file, log_file):
    """
    Run MCA performance analysis on the RISCV asm `input_file`.
    """
    cmd_base = "llvm-mca -mtriple=riscv64 -mcpu=sifive-u74 -mattr=+m,+zba,+zbb,+zbs,+zicond "
    cmd = cmd_base + input_file + " > " + output_file
    run_command(cmd, log_file)


def run_tests():
    # clear results directory
    setup_benchmarking_directories()

    idx = 0
    for filename in os.listdir(XDSL_ASM_DIR):
        input_file = os.path.join(XDSL_ASM_DIR, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(MCA_VEIR_XDSL_DIR, basename + '.out')
        log_file = open(os.path.join(LOGS_DIR, 'veir_xdsl_' + filename), 'w')
        mca_analysis(input_file, output_file, log_file)
        idx += 1
        percentage = ((float(idx) + float(1)) / float(len(os.listdir(XDSL_ASM_DIR)))) * 100
        print(f"running mca analysis on veir-xdsl asm: {percentage:.2f}%")

    idx = 0
    for filename in os.listdir(VEIR_REGALLOC_ASM_DIR):
        input_file = os.path.join(VEIR_REGALLOC_ASM_DIR, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(MCA_VEIR_LLVM_DIR, basename + '.out')
        log_file = open(os.path.join(LOGS_DIR, 'veir_llvm_' + filename), 'w')
        mca_analysis(input_file, output_file, log_file)
        idx += 1
        percentage = ((float(idx) + float(1)) / float(len(os.listdir(VEIR_REGALLOC_ASM_DIR)))) * 100
        print(f"running mca analysis on veir-llvm asm: {percentage:.2f}%")

    idx = 0
    for filename in os.listdir(LLC_ASM_globalisel_DIR):
        input_file = os.path.join(LLC_ASM_globalisel_DIR, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(MCA_LLVM_globalisel_DIR, basename + ".out")
        log_file = open(os.path.join(LOGS_DIR, "llvm_globalisel_" + filename), "w")
        mca_analysis(input_file, output_file, log_file)
        idx += 1
        percentage = (
            (float(idx) + float(1)) / float(len(os.listdir(LLC_ASM_globalisel_DIR)))
        ) * 100
        print(f"running mca analysis on llc asm (globalISel): {percentage:.2f}%")

    idx = 0
    for filename in os.listdir(LLC_ASM_selectiondag_DIR):
        input_file = os.path.join(LLC_ASM_selectiondag_DIR, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(MCA_LLVM_selectiondag_DIR, basename + ".out")
        log_file = open(os.path.join(LOGS_DIR, "llvm_selectiondag_" + filename), "w")
        mca_analysis(input_file, output_file, log_file)
        idx += 1
        percentage = (
            (float(idx) + float(1)) / float(len(os.listdir(LLC_ASM_selectiondag_DIR)))
        ) * 100
        print(f"running mca analysis on llc asm (selectionDAG): {percentage:.2f}%")


def main():
    run_tests()


if __name__ == "__main__":
    main()
