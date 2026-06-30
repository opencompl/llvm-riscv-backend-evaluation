#!/usr/bin/env python3

import subprocess
from utils.mca import setup_mca_directories, run_mca_folder


ROOT_DIR = (
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode("utf-8")
    .strip()
)
TIMEOUT = 1800  # seconds

LLC_ASM_globalisel_DIR = f"{ROOT_DIR}/benchmarks/LLC_ASM_globalisel/"
LLC_ASM_selectiondag_DIR = f"{ROOT_DIR}/benchmarks/LLC_ASM_selectiondag/"
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


def run_tests():
    # clear results directory
    setup_mca_directories(ROOT_DIR, AUTOGEN_DIR_PATHS)

    log_index = "veir_xdsl_"
    run_mca_folder(XDSL_ASM_DIR, MCA_VEIR_XDSL_DIR, LOGS_DIR, log_index, ROOT_DIR)

    log_index = "veir_llvm_"
    run_mca_folder(
        VEIR_REGALLOC_ASM_DIR, MCA_VEIR_LLVM_DIR, LOGS_DIR, log_index, ROOT_DIR
    )

    log_index = "llvm_globalisel_"
    run_mca_folder(
        LLC_ASM_globalisel_DIR, MCA_LLVM_globalisel_DIR, LOGS_DIR, log_index, ROOT_DIR
    )

    log_index = "llvm_selectiondag_"
    run_mca_folder(
        LLC_ASM_selectiondag_DIR,
        MCA_LLVM_selectiondag_DIR,
        LOGS_DIR,
        log_index,
        ROOT_DIR,
    )


def main():
    run_tests()


if __name__ == "__main__":
    main()
