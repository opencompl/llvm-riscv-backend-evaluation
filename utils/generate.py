import sys
import os
import shutil
import subprocess
import re
import tempfile
import concurrent.futures


def cleanup_empty_logs(LOGS_DIR_PATH):
    err = 0
    for filename in os.listdir(LOGS_DIR_PATH):
        log_path = os.path.join(LOGS_DIR_PATH, filename)
        if os.path.isfile(log_path) and os.path.getsize(log_path) == 0:
            os.remove(log_path)
        else:
            err += 1
            print(log_path)
    print(f"{err} failed lowerings.")
    return err


def setup_benchmarking_directories(AUTOGEN_DIR_PATHS):
    """
    Create clean directories to store the benchmarks.
    """
    for directory in AUTOGEN_DIR_PATHS:
        if not os.path.exists(directory):
            os.makedirs(directory)
        else:
            print(f"Directory {directory} already exists. Cleaning up...")
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
        r"\g<1>0 : i1\2",
        content,
    )
    content = re.sub(
        r'("llvm\.mlir\.constant"\(\) <\{"value" = )true(\}> : \(\) -> i1)',
        r"\g<1>1 : i1\2",
        content,
    )
    with open(file_path, "w") as f:
        f.write(content)


def rewrite_value_attr_to_immediate(file_path):
    with open(file_path, "r") as f:
        content = f.read()
    # riscv.li is renamed to rv64.li and takes a 64-bit immediate
    content = re.sub(
        r'riscv\.li\"(\([^)]*\)) <\{"value" = (-?\d+) : i64\}>',
        r'rv64.li"\1 {immediate = \2 : i64}',
        content,
    )
    # riscv.ld is renamed to rv64.ld with offset(base) custom format
    content = re.sub(
        r'"riscv\.ld"\(([^)]*)\) <\{"value" = (-?\d+) : i64\}>',
        r"rv64.ld \2(\1)",
        content,
    )
    # riscv.bclri takes a 6-bit immediate
    content = re.sub(
        r'(riscv\.bclri\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>',
        r"\1 {immediate = \3 : ui6}",
        content,
    )
    # riscv.slli is renamed to rv64.slli and takes a 6-bit unsigned immediate
    content = re.sub(
        r'riscv\.slli\"(\([^)]*\)) <\{"value" = (-?\d+) : i64\}>',
        r'rv64.slli"\1 {immediate = \2 : ui6}',
        content,
    )
    # riscv.seli is renamed to rv64.slli and takes a 6-bit unsigned immediate
    content = re.sub(
        r'riscv\.srli\"(\([^)]*\)) <\{"value" = (-?\d+) : i64\}>',
        r'rv64.srli"\1 {immediate = \2 : ui6}',
        content,
    )
    # all other riscv ops with a value attribute take a 12-bit signed immediate
    content = re.sub(
        r'(riscv\.\w+\"(\([^)]*\))) <\{"value" = (-?\d+) : i64\}>',
        r"\1 {immediate = \3 : si12}",
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


def run_command(cmd, log_file, timeout, root_dir):
    try:
        ret_code = subprocess.Popen(
            cmd, cwd=root_dir, stdout=log_file, stderr=log_file, shell=True
        ).wait(timeout=timeout)
        return ret_code
    except subprocess.TimeoutExpired:
        log_file.truncate(0)
        log_file.write(f"timeout of {timeout} seconds reached\n")
        print(f"{log_file} - timeout of {timeout} seconds reached")


def iter_functions(input_file):
    """Yield each function of a multi-function MLIR file as a list of dedented lines."""
    with open(input_file, "r") as f:
        all_lines = f.readlines()
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
            yield curr_program
            curr_program = []


def write_function(curr_program, out_path):
    with open(out_path, "w") as out_f:
        out_f.writelines(curr_program)
        out_f.write("\n")


def extract_helper(
    input_file, output_base, max_functions, base_name, filter_fn=None, start_index=0
):
    function_count = start_index
    for curr_program in iter_functions(input_file):
        out_path = output_base + f"{base_name}{function_count}.mlir"
        write_function(curr_program, out_path)
        if filter_fn is None or filter_fn(out_path):
            function_count += 1
        else:
            # rejected: drop the file and keep scanning so the next
            # candidate backfills this slot
            os.remove(out_path)
        if function_count >= max_functions:
            print(f"Reached maximum of {max_functions} functions. Stopping extraction.")
            break
    return function_count


def extract_all(input_file, output_base, base_name):
    """Extract every function into output_base as base_name{i}.mlir; return the paths in order."""
    paths = []
    for i, curr_program in enumerate(iter_functions(input_file)):
        out_path = output_base + f"{base_name}{i}.mlir"
        write_function(curr_program, out_path)
        paths.append(out_path)
    return paths


def extract(input_dir, output_base, max_functions, filter_fn=None, start_index=0):
    size = input_dir.split("_")[-1].split(".")[0]
    base_name = f"{size}_function_"
    return extract_helper(
        input_dir, output_base, max_functions, base_name, filter_fn, start_index
    )


FUNC_SIGNATURE_RE = re.compile(
    r"func\.func\s+@\w+\s*\((?P<args>[^)]*)\)(?:\s*->\s*(?P<ret>.+?))?\s*\{"
)
ARG_RE = re.compile(r"(%\w+)\s*:\s*i(\d+)")


def sample_inputs(arg_widths, rng):
    """
    Uniformly sample one value per argument bitwidth, as a signed
    two's-complement integer (the form llvm.mlir.constant attributes parse).
    """
    values = []
    for width in arg_widths:
        v = rng.getrandbits(width)
        if v >= 1 << (width - 1):
            v -= 1 << width
        values.append(v)
    return values


def interpret_function(
    mlir_file, rng, veir_interpret_bin, interpret_logs_dir, root_dir, timeout, n_trials=10
):
    """
    Run a single-function MLIR file under veir-interpret n_trials times with
    uniformly-sampled random inputs. veir-interpret only accepts a
    zero-argument `main` entry point, so each trial rewrites the function
    arguments into llvm.mlir.constant ops in a wrapper file, converted to
    generic syntax with mlir-opt.

    Returns True (keep) if at least one trial returns a regular numerical
    result, False (discard) if every trial hits UB, poison, or an error.
    """
    name = os.path.splitext(os.path.basename(mlir_file))[0]
    with open(mlir_file, "r") as f:
        lines = f.readlines()
    log = open(os.path.join(interpret_logs_dir, f"{name}.log"), "w")
    match = FUNC_SIGNATURE_RE.match(lines[0]) if lines else None
    if match is None:
        log.write(f"could not parse function signature: {lines[0] if lines else '<empty file>'}\n")
        log.close()
        return False
    args = [(arg_name, int(width)) for arg_name, width in ARG_RE.findall(match.group("args"))]
    ret_type = match.group("ret")

    numerical = 0
    trials_run = 0
    for trial in range(n_trials):
        trials_run = trial + 1
        values = sample_inputs([width for _, width in args], rng)
        log.write(f"trial {trial} inputs: ")
        log.write(", ".join(f"{n}={v}" for (n, _), v in zip(args, values)) + "\n")

        wrapper_path = os.path.join(interpret_logs_dir, f"{name}_trial{trial}.mlir")
        with open(wrapper_path, "w") as w:
            w.write(f"func.func @main() -> {ret_type} {{\n" if ret_type else "func.func @main() {\n")
            for (arg_name, width), value in zip(args, values):
                w.write(f"  {arg_name} = llvm.mlir.constant({value} : i{width}) : i{width}\n")
            w.writelines(lines[1:])

        # convert to generic syntax (also verifies the wrapper)
        generic_path = os.path.join(interpret_logs_dir, f"{name}_trial{trial}_generic.mlir")
        log.flush()
        ret_code = run_command(
            f"mlir-opt --mlir-print-op-generic {wrapper_path} -o {generic_path}",
            log,
            timeout,
            root_dir,
        )
        if ret_code != 0:
            log.write(f"trial {trial}: mlir-opt failed\n")
            continue

        # veir only parses the exact flag under the spelling "exact", while
        # upstream mlir-opt prints "isExact"; rewrite so exact-division
        # poison is actually observed by the interpreter
        with open(generic_path, "r") as gf:
            generic = gf.read()
        with open(generic_path, "w") as gf:
            gf.write(re.sub(r"\bisExact\b", "exact", generic))

        try:
            proc = subprocess.run(
                [veir_interpret_bin, generic_path],
                cwd=root_dir,
                capture_output=True,
                text=True,
                timeout=timeout,
            )
        except subprocess.TimeoutExpired:
            log.write(f"trial {trial}: timeout of {timeout} seconds reached\n")
            continue
        log.write(proc.stdout)
        log.write(proc.stderr)
        ok = (
            proc.returncode == 0
            and "Program output:" in proc.stdout
            and "poison" not in proc.stdout
        )
        log.write(f"trial {trial}: {'numerical' if ok else 'non-numerical'}\n")
        numerical += ok
        if numerical:
            # keep is already decided; skip the remaining trials
            break

    keep = numerical > 0
    log.write(f"{numerical}/{trials_run} numerical -> {'keep' if keep else 'discard'}\n")
    log.close()
    return keep


def MLIR_opt(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Run mlir-opt and convert a file into LLVM dialect.
    """
    cmd_base = "mlir-opt -convert-func-to-llvm --mlir-print-op-generic "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code


def LLVM_opt(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Run opt with `O2` on an LLVM file.
    """
    # Force full unrolling of constant-trip loops so functions collapse to a
    # single basic block. 
    cmd_base = (
        "opt -O2 -vectorize-slp=0 -vectorize-loops=0 -S ")
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code

def LLVM_opt_unroll(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Run opt with `O2` on an LLVM file.
    """
    # Force full unrolling of constant-trip loops so functions collapse to a
    # single basic block. 
    cmd_base = (
        "opt -O2 -vectorize-slp=0 -vectorize-loops=0 "
        "-unroll-threshold=1000000 -unroll-full-max-count=1000 -S ")
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code


def LLVM_to_MLIR(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Run mlir-translate and translate a file from LLVM dialect to LLVMIR.
    """
    cmd_base = "mlir-translate --import-llvm --mlir-print-op-generic "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code


def MLIR_to_LLVM(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Run mlir-translate and translate a file from LLVM dialect to LLVMIR.
    """
    cmd_base = "mlir-translate --mlir-to-llvmir "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code


def LLC_selectiondag(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Compile LLVMIR to RISCV assembly with llc.
    """
    cmd_base = "llc -march=riscv64 -mcpu=generic-rv64 -mattr=+m,+zba,+zbb,+zbs,+zbc,+zbkb,+zicond -filetype=asm "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code
    
def LLC_selectiondag_no_combines(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Compile LLVMIR to RISCV assembly with llc.
    """
    cmd_base = "llc -march=riscv64 -mcpu=generic-rv64 -combiner-disabled -mattr=+m,+zba,+zbb,+zbs,+zbc,+zbkb,+zicond -filetype=asm "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code


def LLC_globalisel(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Compile LLVMIR to RISCV assembly with llc using the GlobalISel framework.
    """
    cmd_base = "llc -march=riscv64 -mcpu=generic-rv64 --global-isel -mattr=+m,+zba,+zbb,+zbs,+zbc,+zbkb,+zicond -filetype=asm "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code
    
def LLC_globalisel_no_combines(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Compile LLVMIR to RISCV assembly with llc using the GlobalISel framework.
    """
    cmd_base = "llc -march=riscv64 -mcpu=generic-rv64  -combiner-disabled --global-isel -mattr=+m,+zba,+zbb,+zbs,+zbc,+zbkb,+zicond -filetype=asm "
    cmd = cmd_base + input_file + " -o " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
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


def VEIR(
    jobs,
    pass_dict,
    MLIR_bb0_VEIR_DIR_PATH,
    VEIR_ASM_DIR_PATH,
    LOGS_DIR_PATH,
    ROOT_DIR_PATH,
    VEIROPT_BIN,
    TIMEOUT,
):
    """
    Lower the input file to RISCV with VeIR, using multiple threads.
    """
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs) as executor:
        futures = {}

        for filename in os.listdir(MLIR_bb0_VEIR_DIR_PATH):
            input_file = os.path.join(MLIR_bb0_VEIR_DIR_PATH, filename)
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(VEIR_ASM_DIR_PATH, basename + ".mlir")
            log_file = open(os.path.join(LOGS_DIR_PATH, basename + "_lake.log"), "w")
            cmd_base = f'{VEIROPT_BIN} -p="isel-sdag-riscv64,isel-br-riscv64,isel-riscv64,reconcile-cast,riscv-combine,dce" '
            cmd = cmd_base + input_file + " > " + output_file
            future = executor.submit(run_command, cmd, log_file, TIMEOUT, ROOT_DIR_PATH)
            futures[future] = output_file

        total = len(futures)
        for idx, future in enumerate(concurrent.futures.as_completed(futures)):
            file_path = futures[future]
            ret_code = future.result()
            pass_dict[file_path] = ret_code
            idx += 1
            percentage = (float(idx) / float(total)) * 100
            print(f"[veir]: {percentage:.2f}%")


def XDSL_create_func(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Remove unrealized casts from the RISCV64 dialect MLIR files with xdsl.
    """
    cmd_base = f"python3 {root_dir}/utils/create_func.py "
    cmd = cmd_base + input_file + " > " + output_file
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code


def XDSL_regalloc(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    """
    Remove unrealized casts from the RISCV64 dialect MLIR files with xdsl and allocate registers.
    """
    try:
        from xdsl.xdsl_opt_main import xDSLOptMain

        xdsl_opt_main = xDSLOptMain(
            args=f"{input_file} -p convert-func-to-riscv-func,reconcile-unrealized-casts,riscv-allocate-registers{{force-infinite=true}},riscv-lower-parallel-mov,riscv-allocate-infinite-registers,canonicalize-register-allocation -t riscv-asm -o {output_file}".split()
        )
        xdsl_opt_main.run()
        pass_dict[output_file] = 1
    except Exception as e:
        print(f"XDSL_reg_alloc failed for {input_file} with error: {e}", file=log_file)
        pass_dict[output_file] = 0


def veir2mir_step(
    input_file, output_file, log_file, pass_dict, VEIR2MIR_BIN, root_dir, timeout
):
    cmd = f"{VEIR2MIR_BIN} {input_file} > {output_file}"
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code


def LLC_mir_regalloc(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    # Stage 1 runs exactly our register-allocation pass pipeline. Because
    # -run-pass forces llc to emit MIR (it ignores -filetype=asm), stage 2 takes
    # that post-regalloc MIR and continues the standard backend from where the
    # pipeline stopped (after postrapseudos) to emit assembly for llvm-mca. The
    # intermediate MIR goes to a temp file so it does not get picked up as a
    # benchmark by the folder-globbing MCA step.
    #
    # No LLVM instruction scheduler runs on the VEIR side: stage 1's -run-pass
    # list contains no pre-RA scheduler, and stage 2 passes -disable-post-ra to
    # drop the post-RA scheduler while still keeping block placement (so branch
    # fallthrough is preserved and code size is not inflated by -O0).
    mattr = "+m,+zba,+zbb,+zbs,+zbc,+zbkb,+zicond"
    fd, regalloc_mir = tempfile.mkstemp(suffix=".mir")
    os.close(fd)
    cmd = (
        f"llc -mtriple=riscv64 -mcpu=generic-rv64 -x mir -mattr={mattr}"
        " -run-pass=phi-node-elimination,register-coalescer,greedy,virtregrewriter,prologepilog,postrapseudos"
        f" -o {regalloc_mir} {input_file}"
        f" && llc -mtriple=riscv64 -mcpu=generic-rv64 -x mir -mattr={mattr}"
        f" --start-after=postrapseudos -disable-post-ra -filetype=asm"
        f" -o {output_file} {regalloc_mir}"
    )
    try:
        ret_code = run_command(cmd, log_file, timeout, root_dir)
    finally:
        if os.path.exists(regalloc_mir):
            os.remove(regalloc_mir)
    pass_dict[output_file] = ret_code


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


def vcc_emit_mlir(input_file, output_file, log_file, pass_dict, root_dir, timeout):
    vcc = root_dir / "veir" / "Tools" / "vcc"
    cmd = f"{vcc} --emit-mlir -O {input_file} -o {output_file}"
    ret_code = run_command(cmd, log_file, timeout, root_dir)
    pass_dict[output_file] = ret_code


def apply_lowering_to_folder(
    input_folder,
    output_folder,
    log_folder,
    input_dict,
    output_dict,
    lowering_fun,
    root_dir,
    timeout,
    pass_name,
    file_ext,
    post_process_fun=None,
):
    idx = 0
    # Run pass on all the files in the folder
    for filename in os.listdir(input_folder):
        input_file = os.path.join(input_folder, filename)
        # only run the lowering if the previous pass was successful
        if input_dict[input_file] == 0:
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(output_folder, basename + file_ext)
            log_file = open(
                os.path.join(log_folder, basename + "_" + pass_name.lower() + ".log"),
                "w",
            )
            lowering_fun(
                input_file,
                output_file,
                log_file,
                output_dict,
                root_dir,
                timeout,
            )
            if post_process_fun:
                post_process_fun(output_file)
        else:
            print(f"FAILURE: Skipping {input_file} because previous pass failed.")
        idx += 1
        percentage = (float(idx) / float(len(input_dict))) * 100
        print(f"[{pass_name}]: {percentage:.2f}%")


def extract_basic_block_folder(input_folder, output_folder, log_folder):
    idx = 0
    for filename in os.listdir(input_folder):
        input_file = os.path.join(input_folder, filename)
        basename, _ = os.path.splitext(filename)
        output_file = os.path.join(output_folder, basename + ".mlir")
        log_file = open(os.path.join(log_folder, basename + "_bb0_extract.log"), "w")
        extract_basic_block(input_file, output_file, log_file)
        idx += 1
        percentage = (float(idx) / float(len(os.listdir(input_folder)))) * 100
        print(f"[extract-bb0]: {percentage:.2f}%")


def VEIR2MIR(
    input_folder,
    output_folder,
    log_folder,
    input_dict,
    pass_dict,
    veir2mirbin,
    root_dir,
    timeout,
):
    idx = 0
    for filename in os.listdir(input_folder):
        input_file = os.path.join(input_folder, filename)
        if input_dict[input_file] == 0:
            basename, _ = os.path.splitext(filename)
            output_file = os.path.join(output_folder, basename + ".mir")
            log_file = open(os.path.join(log_folder, basename + "_veir2mir.log"), "w")
            veir2mir_step(
                input_file,
                output_file,
                log_file,
                pass_dict,
                veir2mirbin,
                root_dir,
                timeout,
            )
        else:
            print(f"FAILURE: Skipping {input_file} because previous pass failed.")
        idx += 1
        percentage = (float(idx) / float(len(os.listdir(input_folder)))) * 100
        print(f"[veir2mir]: {percentage:.2f}%")
