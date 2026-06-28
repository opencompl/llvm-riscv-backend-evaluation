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
import shutil
import subprocess
import re
import argparse
import concurrent.futures


ROOT_DIR_PATH = (
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode("utf-8")
    .strip()
)

TIMEOUT_SEC = 1800

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
    XDSL_ASM_DIR_PATH,
    LOGS_DIR_PATH,
    LLVM_OPTIMIZED_DIR_PATH,
    MLIR_OPTIMIZED_DIR_PATH,
]


def cleanup_empty_logs():
    for filename in os.listdir(LOGS_DIR_PATH):
        log_path = os.path.join(LOGS_DIR_PATH, filename)
        if os.path.isfile(log_path) and os.path.getsize(log_path) == 0:
            os.remove(log_path)


def setup_benchmarking_directories():
    """
    Create clean directories to store the benchmarks.
    """
    for directory in AUTOGEN_DIR_PATHS:
        if not os.path.exists(directory):
            os.makedirs(directory)
        else:
            shutil.rmtree(directory)
            os.makedirs(directory)


def sanitize(file_path):
    with open(file_path, "r") as f:
        content = f.read()
    content = content.replace("sextw", "sext.w")
    content = content.replace("zextw", "zext.w")
    content = content.replace("czeroeqz", "czero.eqz")
    content = content.replace("czeronez", "czero.nez")


    with open(file_path, "w") as f:
        f.write(content)


def replace_bool_constants(file_path):
    """Replace boolean literal attributes in llvm.mlir.constant with i1 integers."""
    with open(file_path, "r") as f:
        content = f.read()
    content = re.sub(
        r'("llvm\.mlir\.constant"\(\) <\{"value" = )false(\}> : \(\) -> i1)',
        r'\g<1>0 : i1\2',
        content,
    )
    content = re.sub(
        r'("llvm\.mlir\.constant"\(\) <\{"value" = )true(\}> : \(\) -> i1)',
        r'\g<1>1 : i1\2',
        content,
    )
    with open(file_path, "w") as f:
        f.write(content)


def rewrite_value_attr_to_immediate(file_path):
    with open(file_path, "r") as f:
        content = f.read()
    content = re.sub(
        r'(riscv\.xori\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>',
        r"\1 {immediate = \3 : si12}",
        content,
    )
    content = re.sub(
        r'(riscv\.sltiu\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>',
        r"\1 {immediate = \3 : si12}",
        content,
    )
    content = re.sub(
        r'(riscv\.slti\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>',
        r"\1 {immediate = \3 : si12}",
        content,
    )
    content = re.sub(
        r'(riscv\.slli\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>',
        r"\1 {immediate = \3 : si12}",
        content,
    )
    content = re.sub(
        r'(riscv\.srai\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>',
        r"\1 {immediate = \3 : si12}",
        content,
    )
    content = re.sub(
        r'(riscv\.ori\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>',
        r"\1 {immediate = \3 : si12}",
        content,
    )
    content = re.sub(
        r'riscv\.li\"(\([^)]*\)) <\{"value" = (-?\d+) : i64\}>',
        r'rv64.li"\1 {immediate = \2 : i64}',
        content,
    )
    content = re.sub(
        r'riscv\.srli\"(\([^)]*\)) <\{"value" = (-?\d+) : i64\}>',
        r'riscv.srli"\1 {immediate = \2 : i20}',
        content,
    )
    with open(file_path, "w") as f:
        f.write(content)


def replace_hyphens_in_variables(file_path):
    """
    Reads a file, replaces hyphens (-) with underscores (_) within
    MLIR variable names (starting with %), and overwrites the file.
    """

    if not os.path.exists(file_path):
        print(f"Error: File not found at {file_path}")
        return

    pattern = r"(%[a-zA-Z0-9_-]+)"

    def variable_replacer(match):
        """Replace all hyphens with underscores in the matched variable name."""
        variable_name = match.group(0)
        if "-" in variable_name:
            return variable_name.replace("-", "_")
        return variable_name

    try:
        with open(file_path, "r") as f:
            original_content = f.read()

        modified_content = re.sub(pattern, variable_replacer, original_content)
        with open(file_path, "w") as f:
            f.write(modified_content)

    except IOError as e:
        print(f"Error processing file {file_path}: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


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


def extract_helper(input_file, output_base, max_functions, base_name):
    f = open(input_file, "r")
    all_lines = f.readlines()
    function_count = 0
    curr_program = []
    brackets_count = 0
    for line in all_lines:
        if "{" in line:
            brackets_count += 1
        if brackets_count == 2:
            # remove indentation
            curr_program.append(line[2:])
        if "}" in line:
            brackets_count -= 1
        if brackets_count == 1 and len(curr_program) > 0:
            # write file
            out_f = open(output_base + f"{base_name}{function_count}.mlir", "w")
            out_f.writelines(curr_program)
            out_f.write("\n")
            out_f.close()
            curr_program = []
            function_count += 1
            curr_program = []
        if function_count >= max_functions:
            print(f"Reached maximum of {max_functions} functions. Stopping extraction.")
            break


def extract(input_dir, output_base, max_functions, type):
    if type:
        for filename in os.listdir(input_dir):
            input_file = os.path.join(input_dir, filename)
            instruction_name = "".join(filename.split(".")[0])
            extract_helper(
                input_file, output_base, max_functions, f"{instruction_name}_"
            )
    else:
        size = input_dir.split("_")[-1].split(".")[0]
        base_name = f"{size}_function_"
        extract_helper(input_dir, output_base, max_functions, base_name)


def MLIR_opt(input_file, output_file, log_file, pass_dict):
    """
    Run mlir-opt and convert a file into LLVM dialect.
    """
    cmd_base = (
        "mlir-opt -convert-arith-to-llvm -convert-func-to-llvm --mlir-print-op-generic "
    )
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file)
    pass_dict[output_file] = ret_code


def LLVM_opt(input_file, output_file, log_file, pass_dict):
    """
    Run opt with `O2` on an LLVM file.
    """
    cmd_base = "opt -O2 -S "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file)
    pass_dict[output_file] = ret_code


def LLVM_to_MLIR(input_file, output_file, log_file, pass_dict):
    """
    Run mlir-translate and translate a file from LLVM dialect to LLVMIR.
    """
    cmd_base = "mlir-translate --import-llvm --mlir-print-op-generic "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file)
    pass_dict[output_file] = ret_code


def MLIR_to_LLVM(input_file, output_file, log_file, pass_dict):
    """
    Run mlir-translate and translate a file from LLVM dialect to LLVMIR.
    """
    cmd_base = "mlir-translate --mlir-to-llvmir "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file)
    pass_dict[output_file] = ret_code


def LLC_selectiondag(input_file, output_file, log_file, pass_dict, opt):
    """
    Compile LLVMIR to RISCV assembly with llc.
    """
    cmd_base = (
        "llc -march=riscv64 -mcpu=generic-rv64 -mattr=+m,+b -filetype=asm " + opt + " "
    )
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file)
    pass_dict[output_file] = ret_code


def LLC_globalisel(input_file, output_file, log_file, pass_dict, opt):
    """
    Compile LLVMIR to RISCV assembly with llc using the GlobalISel framework.
    """
    cmd_base = (
        "llc -march=riscv64 -mcpu=generic-rv64 --global-isel -mattr=+m,+b -filetype=asm "
        + opt
        + " "
    )
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file)
    pass_dict[output_file] = ret_code


def rename_numeric_block_labels(file_path):
    """Rename block labels starting with a digit (e.g. ^4) to ^bb4 in-place."""
    with open(file_path, "r") as f:
        content = f.read()
    content = re.sub(r"\^(\d+)", r"^bb\1", content)
    with open(file_path, "w") as f:
        f.write(content)


def parse_return_type(llvm_return_line):
    """Extract the function return type from an 'llvm.return' line."""
    m = re.search(r":\s*\(([^)]*)\)\s*->", llvm_return_line)
    if m and m.group(1).strip():
        return m.group(1).strip()
    return "()"


def extract_basic_block(input_file, output_file, log_file):
    """
    Extract the first basic block from the MLIR file, wrap it in a func.func
    inside a builtin.module.
    """
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

    ret_type = parse_return_type(block_lines[-1]) if block_lines else "()"
    func_type = f"() -> {ret_type}"

    with open(output_file, "w") as o_f:
        o_f.write('"builtin.module"() ({\n')
        o_f.write(
            f'  "func.func"() <{{sym_name = "func0", function_type = {func_type}}}> ({{\n'
        )
        o_f.write(f"  {bb0_line}\n")
        for line in block_lines:
            o_f.write(f"    {line}\n")
        o_f.write("  }): () -> ()\n")
        o_f.write("}) : () -> ()\n")


def VEIR(jobs, pass_dict):
    """
    Lower the input file to RISCV with VeIR, using multiple threads.
    """
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs) as executor:
        futures = {}

        for filename in os.listdir(MLIR_bb0_VEIR_DIR_PATH):
            input_file = os.path.join(MLIR_bb0_VEIR_DIR_PATH, filename)
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(VEIR_ASM_DIR_PATH, basename + ".mlir")
            log_file = open(LOGS_DIR_PATH + basename + "_lake.mlir", "w")
            cmd_base = f'cd {ROOT_DIR_PATH}/veir; lake exec veir-opt -p="isel-sdag-riscv64,isel-br-riscv64,isel-riscv64,reconcile-cast,dce,riscv-combine" '
            cmd = cmd_base + input_file + " > " + output_file
            future = executor.submit(run_command, cmd, log_file)
            futures[future] = output_file

        total = len(futures)
        for idx, future in enumerate(concurrent.futures.as_completed(futures)):
            file_path = futures[future]
            ret_code = future.result()
            pass_dict[file_path] = ret_code
            percentage = (float(idx) / float(total)) * 100
            print(f"compiling with veir {percentage:.2f}%")


def XDSL_create_func(input_file, output_file, log_file, pass_dict):
    """
    Remove unrealized casts from the RISCV64 dialect MLIR files with xdsl.
    """
    cmd_base = f"python3 {ROOT_DIR_PATH}/benchmarks/create_func.py "
    cmd = cmd_base + input_file + " > " + output_file
    ret_code = run_command(cmd, log_file)
    pass_dict[output_file] = ret_code


def XDSL_regalloc(input_file, output_file, log_file, pass_dict):
    """
    Remove unrealized casts from the RISCV64 dialect MLIR files with xdsl.
    """
    try:
        from xdsl.xdsl_opt_main import xDSLOptMain

        xdsl_opt_main = xDSLOptMain(
            args=f"{input_file} -p convert-func-to-riscv-func,reconcile-unrealized-casts,riscv-allocate-registers{{force-infinite=true}},riscv-allocate-infinite-registers,canonicalize-register-allocation -t riscv-asm -o {output_file}".split()
        )
        xdsl_opt_main.run()
        # cmd = cmd_base + input_file + " > " + output_file
        # ret_code = run_command(cmd, log_file)
        pass_dict[output_file] = 1
    except Exception as e:
        print(f"XDSL_reg_alloc failed for {input_file} with error: {e}", file=log_file)
        pass_dict[output_file] = 0


def generate_benchmarks(num, jobs, llvm_opt, compare_lowering_patterns=False):
    setup_benchmarking_directories()

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
        MLIR_opt(input_file, output_file, log_file, MLIR_opt_file2ret)
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
            MLIR_to_LLVM(input_file, output_file, log_file, MLIR_translate_file2ret)
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
            LLVM_opt(input_file, output_file, log_file, LLVM_preopt_file2ret)
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
            LLVM_to_MLIR(input_file, output_file, log_file, MLIR_preopt_file2ret)
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
                LLC_selectiondag(input_file, output_file, log_file, LLC_file2ret, "")
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
                    input_file, output_file, log_file, LLC_file2ret, "-" + llvm_opt
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
                    input_file, output_file, log_file, LLC_GLOBALISEL_file2ret, ""
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
    VEIR(jobs, LAKE_file2ret_opt)

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

    cleanup_empty_logs()


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

    generate_benchmarks(args.num, args.jobs, args.llvm_opt, args.instruction_lowering)


if __name__ == "__main__":
    main()
