#!/usr/bin/env python3

import os
import shutil
import subprocess

TIMEOUT = 1800


def setup_mca_directories(ROOT_DIR, AUTOGEN_DIR_PATHS):
    """
    Create clean directories to store the benchmarks.
    """
    results_dir = f"{ROOT_DIR}/results/"
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


def run_mca_file(input_file, output_file, log_file, root_dir):
    """
    Run MCA performance analysis on the RISCV asm `input_file`.
    """
    cmd_base = (
        "llvm-mca -mtriple=riscv64 -mcpu=sifive-u74 -mattr=+m,+b "
    )
    cmd = cmd_base + input_file + " > " + output_file
    run_command(cmd, log_file, 1800, root_dir)


def run_mca_folder(input_dir, output_dir, log_dir, log_index, root_dir):
    idx = 0
    for filename in os.listdir(input_dir):
        input_file = os.path.join(input_dir, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(output_dir, basename + ".out")
        log_file = open(os.path.join(log_dir, log_index + filename), "w")
        run_mca_file(input_file, output_file, log_file, root_dir)
        idx += 1
        percentage = ((float(idx)) / float(len(os.listdir(input_dir)))) * 100
        print(f"running mca analysis on {log_index}asm: {percentage:.2f}%")
