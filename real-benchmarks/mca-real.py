#!/usr/bin/env python3

import subprocess
from utils.mca import setup_mca_directories, run_mca_folder


ROOT_DIR = (
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode("utf-8")
    .strip()
)
TIMEOUT = 1800  # seconds

LLC_ASM_globalisel_DIR = f"{ROOT_DIR}/real-benchmarks/LLC_ASM_globalisel/"
LLC_ASM_selectiondag_DIR = f"{ROOT_DIR}/real-benchmarks/LLC_ASM_selectiondag/"
LLC_ASM_DIR = f"{ROOT_DIR}/real-benchmarks/LLC_ASM/"
VEIR_REGALLOC_ASM_DIR = f"{ROOT_DIR}/real-benchmarks/VEIR_REGALLOC_ASM/"
VEIR_REGALLOC_ASM_DIR = f"{ROOT_DIR}/real-benchmarks/VEIR_REGALLOC_ASM/"
MCA_VEIR_DIR = f"{ROOT_DIR}/real-benchmarks/results/VEIR/"

MCA_LLVM_globalisel_DIR = (
    f"{ROOT_DIR}/real-benchmarks/results/LLVM_globalisel/"
)
MCA_LLVM_selectiondag_DIR = (
    f"{ROOT_DIR}/real-benchmarks/results/LLVM_selectiondag/"
)
LOGS_DIR = f"{ROOT_DIR}/real-benchmarks/results/logs/"


AUTOGEN_DIR_PATHS = [
    MCA_VEIR_DIR,
    MCA_LLVM_globalisel_DIR,
    MCA_LLVM_selectiondag_DIR,
    LOGS_DIR,
]


def main():
    # clear results directory
    setup_mca_directories(f"{ROOT_DIR}/real-benchmarks", AUTOGEN_DIR_PATHS)

    log_index = "veir_"
    run_mca_folder(VEIR_REGALLOC_ASM_DIR, MCA_VEIR_DIR, LOGS_DIR, log_index, ROOT_DIR)

    log_index = "gisel_"
    run_mca_folder(
        LLC_ASM_globalisel_DIR, MCA_LLVM_globalisel_DIR, LOGS_DIR, log_index, ROOT_DIR
    )

    log_index = "sdag_"
    run_mca_folder(
        LLC_ASM_selectiondag_DIR,
        MCA_LLVM_selectiondag_DIR,
        LOGS_DIR,
        log_index,
        ROOT_DIR,
    )


if __name__ == "__main__":
    main()
