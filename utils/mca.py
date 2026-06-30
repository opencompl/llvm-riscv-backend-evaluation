#!/usr/bin/env python3

import os
import shutil
import subprocess

TIMEOUT = 1800


def setup_mca_directories(ROOT_DIR, AUTOGEN_DIR_PATHS):
    """
    Create clean directories to store the benchmarks.
    """
    results_dir = f"{ROOT_DIR}/mca-analysis/results/"
    if not os.path.exists(results_dir):
        os.makedirs(results_dir)
    for directory in AUTOGEN_DIR_PATHS:
        if not os.path.exists(directory):
            os.makedirs(directory)
        else:
            shutil.rmtree(directory)
            os.makedirs(directory)


def run_command(cmd, log_file, timeout, ROOT_DIR):
    try:
        print(cmd)
        subprocess.Popen(
            cmd, cwd=ROOT_DIR, stdout=log_file, stderr=log_file, shell=True
        ).wait(timeout=timeout)
    except subprocess.TimeoutExpired:
        log_file.truncate(0)
        log_file.write(f"timeout of {timeout} seconds reached\n")
        print(f"{log_file} - timeout of {timeout} seconds reached")


def mca_analysis(input_file, output_file, log_file):
    """
    Run MCA performance analysis on the RISCV asm `input_file`.
    """
    cmd_base = (
        "llvm-mca -mtriple=riscv64 -mcpu=sifive-u74 -mattr=+m,+zba,+zbb,+zbs,+zicond "
    )
    cmd = cmd_base + input_file + " > " + output_file
    run_command(cmd, log_file)


def run_mca_tool(DATA_DIR, RESULTS_DIR, LOGS_DIR):
    idx = 0
    for filename in os.listdir(DATA_DIR):
        input_file = os.path.join(DATA_DIR, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(RESULTS_DIR, basename + ".out")
        log_file = open(os.path.join(LOGS_DIR, "veir_xdsl_" + filename), "w")
        mca_analysis(input_file, output_file, log_file)
        percentage = ((float(idx) + float(1)) / float(len(os.listdir(DATA_DIR)))) * 100
        idx += 1
        print(f"running mca analysis on veir-xdsl asm: {percentage:.2f}%")
