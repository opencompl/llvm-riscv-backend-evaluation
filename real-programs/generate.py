#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.12"
# dependencies = ["xdsl"]
#
# [tool.uv.sources]
# xdsl = { path = "../xdsl" }
# ///


import sys
import os
import subprocess
import re
import argparse


ROOT_DIR_PATH = (
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode("utf-8")
    .strip()
)

REAL_PROGRAMS = [
    "fastntt",
]

REAL_PROGRAMS_DIR = f"{ROOT_DIR_PATH}/real-programs"
TIMEOUT_SEC = 1800


def run_command(cmd, log_file, timeout=TIMEOUT_SEC):
    try:
        ret_code = subprocess.Popen(
            cmd, cwd=ROOT_DIR_PATH, stdout=log_file, stderr=log_file, shell=True
        ).wait(timeout=timeout)
        return ret_code
    except subprocess.TimeoutExpired:
        log_file.truncate(0)
        log_file.write(f"timeout of {timeout} seconds reached\n")
        print(f"{log_file} - timeout of {timeout} seconds reached")


def sanitize(file_path):
    with open(file_path, "r") as f:
        content = f.read()
    content = content.replace("sextw", "sext.w")
    content = content.replace("zextw", "zext.w")
    content = content.replace("czeroeqz", "czero.eqz")
    content = content.replace("czeronez", "czero.nez")
    with open(file_path, "w") as f:
        f.write(content)


def rewrite_value_attr_to_immediate(file_path):
    with open(file_path, "r") as f:
        content = f.read()
    content = re.sub(r'(riscv\.xori\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>', r'\1 {immediate = \3 : si12}', content)
    content = re.sub(r'(riscv\.sltiu\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>', r'\1 {immediate = \3 : si12}', content)
    content = re.sub(r'riscv\.li\"(\([^)]*\)) <\{"value" = (-?\d+) : i64\}>', r'riscv.lui"\1 {immediate = \2 : i20}', content)
    with open(file_path, "w") as f:
        f.write(content)


def rename_numeric_block_labels(file_path):
    with open(file_path, "r") as f:
        content = f.read()
    content = re.sub(r'\^(\d+)', r'^bb\1', content)
    with open(file_path, "w") as f:
        f.write(content)


def _parse_return_type(llvm_return_line):
    m = re.search(r':\s*\(([^)]*)\)\s*->', llvm_return_line)
    if m and m.group(1).strip():
        return m.group(1).strip()
    return "()"


def extract_bb0_veIR(input_file, output_file, log_file):
    in_block = False
    bb0_line = None
    block_lines = []

    try:
        with open(input_file, "r") as f:
            for line in f:
                line = line.strip()
                if "^bb0(" in line:
                    in_block = True
                    bb0_line = line
                    continue
                if in_block:
                    line = line.replace('"llvm.return"', '"func.return"')
                    block_lines.append(line)
                    if '"func.return"' in line:
                        break
    except FileNotFoundError:
        print(f"Error: The file '{input_file}' was not found.", file=log_file)
        sys.exit(1)

    if bb0_line is None:
        return

    ret_type = _parse_return_type(block_lines[-1]) if block_lines else "()"
    func_type = f"() -> {ret_type}"

    with open(output_file, "w") as o_f:
        o_f.write('"builtin.module"() ({\n')
        o_f.write(f'  "func.func"() <{{sym_name = "func0", function_type = {func_type}}}> ({{\n')
        o_f.write(f'  {bb0_line}\n')
        for l in block_lines:
            o_f.write(f'    {l}\n')
        o_f.write('  }): () -> ()\n')
        o_f.write('}) : () -> ()\n')


def MLIR_opt_arith_llvm(input_file, output_file, log_file, pass_dict):
    cmd = "mlir-opt -convert-arith-to-llvm -convert-func-to-llvm --mlir-print-op-generic " + input_file + " -o " + output_file
    pass_dict[output_file] = run_command(cmd, log_file)


def MLIR_translate_llvmir(input_file, output_file, log_file, pass_dict):
    cmd = "mlir-translate --mlir-to-llvmir " + input_file + " -o " + output_file
    pass_dict[output_file] = run_command(cmd, log_file)


def LLC_compile_riscv_selectiondag(input_file, output_file, log_file, pass_dict, opt):
    cmd = "llc -march=riscv64 -mcpu=generic-rv64 -mattr=+m,+b -filetype=asm " + opt + " " + input_file + " -o " + output_file
    pass_dict[output_file] = run_command(cmd, log_file)


def LLC_compile_riscv_globalisel(input_file, output_file, log_file, pass_dict, opt):
    cmd = "llc -march=riscv64 -mcpu=generic-rv64 --global-isel -mattr=+m,+b -filetype=asm " + opt + " " + input_file + " -o " + output_file
    pass_dict[output_file] = run_command(cmd, log_file)


def XDSL_create_func(input_file, output_file, log_file, pass_dict):
    cmd = f"python3 {ROOT_DIR_PATH}/benchmarks/create_func.py " + input_file + " > " + output_file
    pass_dict[output_file] = run_command(cmd, log_file)


def XDSL_reg_alloc(input_file, output_file, log_file, pass_dict):
    try:
        from xdsl.xdsl_opt_main import xDSLOptMain

        xdsl_opt_main = xDSLOptMain(
            args=f"{input_file} -p convert-func-to-riscv-func,reconcile-unrealized-casts,riscv-allocate-registers{{force-infinite=true}},riscv-allocate-infinite-registers,canonicalize-register-allocation -t riscv-asm -o {output_file}".split()
        )
        xdsl_opt_main.run()
        pass_dict[output_file] = 0
    except Exception as e:
        print(f"XDSL_reg_alloc failed for {input_file} with error: {e}", file=log_file)
        pass_dict[output_file] = 1


def lower_real_programs(llvm_opt):
    for folder in REAL_PROGRAMS:
        program_dir = os.path.join(REAL_PROGRAMS_DIR, folder)
        logs_dir = os.path.join(program_dir, "logs")
        os.makedirs(logs_dir, exist_ok=True)

        mlir_files = [
            f for f in os.listdir(program_dir)
            if f.endswith(".mlir") and not f.startswith(folder + "_")
        ]
        if len(mlir_files) != 1:
            print(f"[{folder}] expected 1 .mlir input, found {len(mlir_files)}")
            continue

        input_file = os.path.join(program_dir, mlir_files[0])
        opt_flag = "" if llvm_opt == "default" else "-" + llvm_opt

        def out(suffix, ext):
            return os.path.join(program_dir, f"{folder}_{suffix}.{ext}")

        def log(name):
            return open(os.path.join(logs_dir, f"{folder}_{name}.log"), "w")

        # mlir-opt → LLVM dialect
        llvm_file = out("llvm", "ll")
        ret = {}
        MLIR_opt_arith_llvm(input_file, llvm_file, log("mlir_opt"), ret)
        print(f"[{folder}] mlir-opt: {'ok' if ret.get(llvm_file) == 0 else 'failed'}")
        if ret.get(llvm_file) != 0:
            continue

        # mlir-translate → LLVM IR
        llvmir_file = out("llvmir", "ll")
        ret = {}
        MLIR_translate_llvmir(llvm_file, llvmir_file, log("mlir_translate"), ret)
        print(f"[{folder}] mlir-translate: {'ok' if ret.get(llvmir_file) == 0 else 'failed'}")
        if ret.get(llvmir_file) != 0:
            continue

        # llc selectionDAG
        sdag_file = out("llc_selectiondag", "s")
        ret = {}
        LLC_compile_riscv_selectiondag(llvmir_file, sdag_file, log("llc_selectiondag"), ret, opt_flag)
        print(f"[{folder}] llc selectionDAG: {'ok' if ret.get(sdag_file) == 0 else 'failed'}")

        # llc GlobalISel
        gisel_file = out("llc_globalisel", "s")
        ret = {}
        LLC_compile_riscv_globalisel(llvmir_file, gisel_file, log("llc_globalisel"), ret, opt_flag)
        print(f"[{folder}] llc GlobalISel: {'ok' if ret.get(gisel_file) == 0 else 'failed'}")

        # extract bb0
        bb0_file = out("bb0", "mlir")
        with open(os.path.join(logs_dir, f"{folder}_bb0.log"), "w") as bb0_log:
            extract_bb0_veIR(llvm_file, bb0_file, bb0_log)
        print(f"[{folder}] bb0 extraction: ok")

        # VeIR lowering
        veir_file = out("veir", "mlir")
        veir_cmd = f"cd {ROOT_DIR_PATH}/veir; lake exec veir-opt -p=\"isel-sdag-riscv64,isel-br-riscv64,isel-riscv64,reconcile-cast,dce,riscv-combine\" {bb0_file} > {veir_file}"
        veir_ret = run_command(veir_cmd, log("veir"))
        print(f"[{folder}] veir: {'ok' if veir_ret == 0 else 'failed'}")
        if veir_ret != 0:
            continue

        sanitize(veir_file)
        rewrite_value_attr_to_immediate(veir_file)
        rename_numeric_block_labels(veir_file)

        # XDSL create_func
        func_file = out("func", "mlir")
        ret = {}
        XDSL_create_func(veir_file, func_file, log("xdsl_func"), ret)
        print(f"[{folder}] XDSL create_func: {'ok' if ret.get(func_file) == 0 else 'failed'}")
        if ret.get(func_file) != 0:
            continue

        # XDSL reg alloc → final assembly
        xdsl_file = out("xdsl", "mlir")
        ret = {}
        XDSL_reg_alloc(func_file, xdsl_file, log("xdsl_reg_alloc"), ret)
        print(f"[{folder}] XDSL reg alloc: {'ok' if ret.get(xdsl_file) == 0 else 'failed'}")


def main():
    parser = argparse.ArgumentParser(
        prog="generate",
        description="Lower real programs from MLIR to RISC-V assembly.",
    )
    parser.add_argument(
        "-llvm",
        "--llvm_opt",
        help="Optimization level for LLVM.",
        choices=["O3", "O2", "O1", "O0", "default"],
        default="default",
    )
    args = parser.parse_args()
    lower_real_programs(args.llvm_opt)


if __name__ == "__main__":
    main()
