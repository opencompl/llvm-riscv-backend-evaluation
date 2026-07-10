# Evaluating Veir's backend against LLVM

This repo evaluates the performance of [Veir](https://github.com/opencompl/veir)'s verified instruction selection pass
against that of LLVM's selectors (GlobalISel and SelectionDAG). We lower a set of real C benchmarks to RISC-V assembly
through each backend and measure them with the [gem5](https://www.gem5.org/) simulator. We also reproduce some real
LLVM bugs found via fuzzing, proving their incorrectness.

Each benchmark is lowered from MLIR to RISC-V assembly across the following pipelines:
- LLC with the GlobalISel selector
- LLC with the SelectionDAG selector
- Veir selector without `riscv-combine` (unoptimized) + LLC register allocator
- Veir selector with the `riscv-combine` pass (optimized) + LLC register allocator

## Repository layout

- `llvm-project/`, `veir/`, `gem5/`: submodules
- `build/`: build output for LLVM, created by `build.sh`
- `real-benchmarks/`: the benchmark pipeline (generation, gem5 runs, tables)
- `utils/`: shared Python library used by the pipeline (packaged via `utils/pyproject.toml`)
- `Bugs.lean`: reproducing real bugs found in LLVM via fuzzing
- `makefile`: generate all benchmarks, run gem5, produce tables
- `.github/workflows/ci.yml`: CI running the same pipeline

## Dependencies & setup

The evaluation depends on:
- LLVM with clang and MLIR
- Veir
- gem5 (plus `scons` to build it)
- a RISC-V cross toolchain for linking the gem5 binaries (`riscv64-linux-gnu-gcc`
  with a sysroot at `/usr/riscv64-linux-gnu`)

All submodules are set up in `.gitmodules`. To fetch them and build everything, run:
```
git submodule update --init --depth 1 -- llvm-project
git submodule update --init -- veir
git submodule update --init -- gem5
./build.sh
```
You can use the same commands to bring in fresh versions of everything and then rebuild.
`build.sh` builds LLVM (clang + MLIR), Veir (`lake build`), gem5 (`scons build/RISCV/gem5.opt`),
and the `utils` package. `bench.py` additionally links against the m5 utility library, built
from `gem5/util/m5` for RISC-V (`gem5/util/m5/build/riscv/out/libm5.a`).

To add llvm and mlir to your path:
```
export PATH=$PATH:/LLVM_PATH/build/bin
```

The benchmark generation script (`generate.py`) is run with `uv run --script`.

## Running the pipeline

Once built, `make pipeline` (alias `make all`) runs everything end to end:

```
make pipeline
```

is equivalent to:
```
uv run real-benchmarks/generate.py
uv run real-benchmarks/bench.py
uv run real-benchmarks/table.py
```

`make clean` removes all generated benchmark/result/data directories, leaving the
pipeline scripts untouched.

Each script also runs standalone via `uv run <path>` and takes its own flags.

## Real benchmarks (`real-benchmarks/`)

`generate.py` lowers a small set of real C programs (`c/`) through every pipeline:
- Compile the C source to MLIR via VCC, output `MLIR_init/*.mlir`.
- `mlir-translate` to LLVM IR, stripping target-specific metadata so `llc` can target RISC-V,
  and generate `LLVMIR/*.ll`.
- `opt` to optimize, save in `LLVM_preopt/*.ll`, then `mlir-translate` back to MLIR and save in `MLIR_preopt/*.mlir`.
- LLVM toolchain: `llc` SelectionDAG/GlobalISel (`LLC_ASM_selectiondag/`, `LLC_ASM_globalisel/`).
- Veir toolchain: extract `bb0` into `MLIR_bb0_veir/`, then lower with `veir-opt` twice:
  - without the `riscv-combine` pass (unoptimized), into `VEIR_ASM/`;
  - with it (optimized), into `VEIR_OPT_ASM/`.

  Each variant is then translated to MIR with `veir2mir` (`VEIR_MIR/`, `VEIR_OPT_MIR/`) and
  register-allocated with `llc` (`VEIR_REGALLOC_ASM/`, `VEIR_OPT_REGALLOC_ASM/`).

`bench.py` assembles and links each pipeline's assembly against the harnesses in
`harnesses/` (using clang and the RISC-V cross toolchain, linking in gem5's m5 library),
runs each binary under gem5 (`TimingSimpleCPU` in syscall-emulation mode), and saves the
stats to `results/<benchmark>_<pipeline>.stats.txt`. It verifies that all pipelines produce
the same checksum for each benchmark and prints a status matrix.

`compare_results.py` pivots those per-run gem5 stats into a benchmark x pipeline table
(cycles or any other stat), with each pipeline's overhead relative to a baseline.

`table.py` reads the same per-run gem5 stats from `results/` and produces CSV/LaTeX/PNG
tables of cycles per iteration with ratios against SelectionDAG, saved into `data/`, and
optionally uploads them to Zulip.

To add a new real benchmark, add the path of the `.c` file to the `BENCHMARKS` list in
`generate.py`, provide a matching harness in `harnesses/`, and list it in `bench.py`'s
benchmark/harness tables.

## `utils/` module

Shared library backing the pipeline, installed as an editable path dependency:
- `generate.py` — all the lowering-step wrappers (`mlir-opt`/`mlir-translate`/`llc`/
  `veir-opt`/`veir2mir`), directory setup/cleanup, and the MLIR extraction/sanitization
  helpers.
- `plot.py` — dataframe construction, plot types (scatter/bar/violin/proportional/
  geomean), LaTeX table/command generation, PDF→JPG conversion, and the Zulip upload helper.
- `lib.py` — small provenance helpers (`root_dir`, `git_hash`, `machine_username`,
  `machine_hostname`, `machine_uname`) used to tag uploaded results.
- `create_func.py` — xDSL-based helper that wraps RISC-V dialect MLIR into a function.
- `upload_zulip.py` — posts result blurbs/plots/attachments to Zulip. Needs a `zuliprc`
  credentials file at the repo root to actually upload; without one, generation/analysis
  still work, only the upload step is skipped/fails.

## Formal verification (`Bugs.lean`)

`Bugs.lean` (built via `lakefile.toml`, which depends on the `veir` submodule as a Lean
package) proves that specific LLVM instruction-selection rewrites are semantically
incorrect, using Veir's formal semantics for LLVM/RISC-V integers as the reference. Build it
the same way as Veir itself, with `lake build` from the repo root (see `build.sh`).
The `guard_msgs` calls ensure that the proofs are complete and `sorry`-free.
