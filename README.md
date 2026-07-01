# Evaluating Veir's backend against LLVM

This repo compares [VeIR](https://github.com/opencompl/veir)'s formally-verified RISC-V
instruction selection against LLVM's SelectionDAG and GlobalISel, on both fuzzer-generated
synthetic programs and a handful of real benchmarks. Every toolchain lowers the same input
down to RISC-V assembly, `llvm-mca` measures the resulting instructions/cycles/uops, and
`Bugs.lean` separately proves (in Lean, against VeIR's formal semantics) that specific LLVM
lowering rewrites are actually incorrect.

## Repository layout

- `llvm-project/`, `veir/`, `xdsl/` — git submodules: LLVM/MLIR/Clang, the VeIR backend
  (a Lean package), and xDSL.
- `build/` — build output: the LLVM/MLIR build (`build/llvm`) and the xDSL venv
  (`build/xdsl-venv`), both produced by `build.sh`.
- `synthetic-benchmarks/` — the fuzzed-benchmark pipeline: `generate.py`, `mca.py`, `plot.py`,
  plus all of their generated intermediate/output directories.
- `real-benchmarks/` — the real-benchmark pipeline: `generate.py`, `mca.py`, `table.py`, plus
  their generated directories.
- `utils/` — shared Python library used by both pipelines (packaged via `utils/pyproject.toml`).
- `generate_multi.py` — regenerates the fuzzed MLIR corpus in `synthetic-benchmarks/MLIR_multi/`
  using the external [mlir-fuzz](https://github.com/opencompl/mlir-fuzz) tool.
- `Bugs.lean`, `lakefile.toml` — Lean proofs that specific LLVM instruction-selection rewrites
  are unsound, checked against VeIR's formal semantics.
- `makefile` — orchestrates the full generate → mca → plot/table pipeline for both benchmark
  sets.
- `.github/workflows/ci.yml` — CI: builds everything and runs `make all` on every push/PR.

## Dependencies & setup

The evaluation depends on:
- LLVM with clang and MLIR
- XDSL
- VEIR

All these dependencies are correctly set up in `.gitmodules`.

To fetch them and then build everything, run:
```
git submodule update --init --depth 1 -- llvm-project
git submodule update --init -- veir xdsl
./build.sh
```
You can use the same commands to bring in fresh versions of everything and then rebuild.
`build.sh` configures/builds LLVM+MLIR+Clang with Ninja, creates the xDSL venv under
`build/xdsl-venv` (installed editable from the `xdsl` submodule), and builds VeIR with `lake`.

To add llvm and mlir to your path:
```
export PATH=$PATH:/LLVM_PATH/build/bin
```

The benchmark generation scripts (`generate.py`) are run with `uv run --script` and declare
their own dependencies inline (including an editable path dependency on `utils/` and `xdsl/`),
so `uv` resolves and caches their environment automatically — no need to manually activate a
venv to run them.

The fuzzed benchmarks in `synthetic-benchmarks/MLIR_multi` come from the
[mlir-fuzz](https://github.com/opencompl/mlir-fuzz) fuzzer, at the version reported in
`MLIR_multi/version_log.txt`. Regenerate them with `python3 generate_multi.py --min_size
--max_size --num` (requires a local checkout of `mlir-fuzz`, built at `~/mlir-fuzz`).

## Running the pipeline

Once built, `make pipeline` (alias `make all`) runs everything end to end:

```
make pipeline
```

which is equivalent to:
```
uv run synthetic-benchmarks/generate.py -j 4
uv run synthetic-benchmarks/mca.py
uv run synthetic-benchmarks/plot.py

uv run real-benchmarks/generate.py
uv run real-benchmarks/mca.py
uv run real-benchmarks/table.py
```

`make quick` runs the same steps single-threaded and with only 5 synthetic benchmarks per
size (`generate.py -j 1 -n 5`), for a fast local smoke-test instead of the full sweep.

`make clean` removes all generated benchmark/result/plot/data directories, leaving the
pipeline scripts and the `MLIR_multi` fuzzer corpus untouched.

Each script also runs standalone via `uv run <path>` and takes its own flags
(e.g. `synthetic-benchmarks/generate.py -n <num> -j <jobs>`, `synthetic-benchmarks/plot.py
-p <parameters> -t <plot_type>`) — pass `--help` to any of them for details.

## Synthetic benchmarks (`synthetic-benchmarks/`)

`generate.py` populates the folders in `synthetic-benchmarks/` by running the following:
- For each file in `MLIR_multi`, extract `num` single MLIR modules and save them in
  `MLIR_single/`. Each extracted file keeps two numbers consistent throughout the lowering
  (e.g. `size_function_num`, where `size` is the initial program size from `generate_multi.py`).
- Using `mlir-opt`, lift each module's `func.func` and print it in generic syntax, saved into
  `LLVMIR/*.mlir`.
- Using `mlir-translate`, convert those to textual LLVM IR, saved into `LLVM/*.ll`.
- Using `opt`, optimize the LLVM IR, saved into `LLVM_preopt/*.ll`. This optimized IR is what
  actually gets lowered by every toolchain below (so all toolchains are compared on the same,
  optimized input).
- Using `mlir-translate` again, lift the optimized LLVM IR back to MLIR (`MLIR_preopt/*.mlir`),
  purely so its first basic block can be extracted for the VeIR toolchain.

Then the optimized IR is lowered through three toolchains, for comparison:

*LLVM toolchain*
- `llc` with SelectionDAG → `LLC_ASM_selectiondag/*.s`
- `llc` with GlobalISel → `LLC_ASM_globalisel/*.s`

*VeIR toolchain (two register allocators)*
- Extract the first block `bb0` from `MLIR_preopt/*.mlir` → `MLIR_bb0_veir/*.mlir`.
- Run VeIR's instruction selection (`veir-opt`), potentially in parallel via `-j`/`--jobs`
  → `VEIR_ASM/*.mlir`.
- Convert to MIR (`veir2mir`) → `VEIR_MIR/*.mir`, then run `llc`'s register allocator on it
  → `VEIR_REGALLOC_ASM/*.s` (the "veir_llvm" pipeline in the results).
- Separately, sanitize `VEIR_ASM` output and wrap it in a `func.func` (`XDSL_FUNC/*.mlir`),
  then register-allocate with xDSL's own allocator → `XDSL_ASM/*.mlir` (the "veir_xdsl"
  pipeline).

Each step produces a log file in `logs/`, named after the function and the pass that
produced it.

`mca.py` then runs `llvm-mca` (targeting `riscv64`, `sifive-u74`, `+m,+b`) over
`LLC_ASM_globalisel`, `LLC_ASM_selectiondag`, `VEIR_REGALLOC_ASM` and `XDSL_ASM`, writing
`.out` files into `results/{LLVM_globalisel,LLVM_selectiondag,VEIR_llvm,VEIR_xdsl}/`.

`plot.py` parses those `.out` files into comparison dataframes (`#instructions`, `#cycles`,
`#uops`, output similarity) saved as CSVs in `data/`, and renders scatter/stacked-bar/
violin/proportional-bar/geomean plots into `plots/` (plus a LaTeX file of the numeric
summary commands, and an optional Zulip upload — see `utils/upload_zulip.py`).

## Real benchmarks (`real-benchmarks/`)

`generate.py` runs the same style of pipeline over a small set of real C programs (currently
`veir/Test/Vcc/fastntt.c`), instead of the fuzzed corpus:
- Compile the C source to MLIR via VCC → `MLIR_init/*.mlir`.
- `mlir-translate` to LLVM IR, stripping target-specific metadata so `llc` can target RISC-V
  → `LLVMIR/*.ll`.
- `opt` to optimize → `LLVM_preopt/*.ll`, then `mlir-translate` back to MLIR → `MLIR_preopt/*.mlir`.
- LLVM toolchain: `llc` SelectionDAG/GlobalISel → `LLC_ASM_selectiondag/`, `LLC_ASM_globalisel/`.
- VeIR toolchain: extract `bb0` → `MLIR_bb0_veir/`, `veir-opt` → `VEIR_ASM/`, `veir2mir` →
  `VEIR_MIR/`, `llc` register allocation → `VEIR_REGALLOC_ASM/`. (No xDSL-regalloc variant here.)

`mca.py` runs `llvm-mca` over `VEIR_REGALLOC_ASM`, `LLC_ASM_globalisel` and
`LLC_ASM_selectiondag`, writing to `results/{VEIR,LLVM_globalisel,LLVM_selectiondag}/`.

`table.py` parses those results into LaTeX and PNG tables of #instructions and #cycles per
iteration, saved into `data/`, and optionally uploads them to Zulip.

## `utils/` module

Shared library backing both pipelines, installed as an editable path dependency:
- `generate.py` — all the lowering-step wrappers (`mlir-opt`/`mlir-translate`/`llc`/
  `veir-opt`/`veir2mir`), directory setup/cleanup, and the MLIR extraction/sanitization
  helpers that turn fuzzer output into individually testable functions.
- `mca.py` — directory setup and the `llvm-mca` file/folder runners.
- `plot.py` — dataframe construction, all the plot types (scatter/bar/violin/proportional/
  geomean), LaTeX table/command generation, PDF→JPG conversion, and the Zulip upload helper.
- `lib.py` — small provenance helpers (`root_dir`, `git_hash`, `machine_username`,
  `machine_hostname`, `machine_uname`) used to tag uploaded results.
- `create_func.py` — an xDSL rewrite pass (`xDSLOptMain` subclass) that wraps VeIR's
  instruction-selection output in a `func.func` when needed, so it can go through xDSL's
  register allocator.
- `upload_zulip.py` — posts result blurbs/plots/attachments to Zulip. Needs a `zuliprc`
  credentials file at the repo root to actually upload; without one, generation/analysis
  still work, only the upload step is skipped/fails.

## Formal verification (`Bugs.lean`)

`Bugs.lean` (built via `lakefile.toml`, which depends on the `veir` submodule as a Lean
package) proves that specific LLVM instruction-selection rewrites are semantically
incorrect, using VeIR's formal semantics for LLVM/RISC-V integers as the reference. Build it
the same way as VeIR itself, with `lake build` from the repo root (see `build.sh`).
