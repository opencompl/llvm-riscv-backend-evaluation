#!/usr/bin/env python3
"""
collect_gem5.py -- turn the raw gem5 stats produced by bench_synth.py
(results/gem5/stats/<name>_<pipeline>.stats.txt) into per-pipeline directories
of llvm-mca-style .out files that plot.py's collect_data()/parse_mca_file() can
read unchanged.

The pipeline directories are named to match plot.py's PIPELINES keys
(VEIR_llvm / LLVM_globalisel / LLVM_selectiondag), so reusing the plotting
script is a one-line repoint of its RESULTS_DIR to results/gem5/.

Each .out reports, from the first (measured-region) gem5 stats dump:
  Instructions:  <simInsts>            (gem5 committed instructions)
  Total Cycles:  <system.cpu.numCycles>
  Total uOps:    <simOps>              (gem5 op count; == instructions on the
                                        in-order TimingSimpleCPU)
parse_mca_file divides each value by 100 (llvm-mca ran with 100 iterations), so
the numbers are written x100 here to round-trip the true gem5 totals.

Usage:
  ./collect_gem5.py                         # results/gem5/stats -> results/gem5/<pipeline>/
  ./collect_gem5.py --stats-dir DIR --out-root DIR
"""

import argparse
import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent

# raw source-pipeline name (as bench_synth.py encodes it in the filename) ->
# the plot pipeline name plot.py expects as a results subdirectory.
PIPELINE_MAP = {
    "VEIR_REGALLOC_ASM": "VEIR_llvm",
    "LLC_ASM_globalisel": "LLVM_globalisel",
    "LLC_ASM_selectiondag": "LLVM_selectiondag",
}

MCA_ITERATIONS = 100  # parse_mca_file divides reported values by this


def first_stat(text: str, name: str):
    """Value of `name` in the first gem5 stats dump (the measured region between
    m5_reset_stats and m5_dump_stats), or None if absent."""
    m = re.search(r"^\s*" + re.escape(name) + r"\s+([-\d.eE+]+)\b", text, re.M)
    if not m:
        return None
    v = m.group(1)
    try:
        return int(v)
    except ValueError:
        return int(float(v))


def split_name(stem: str):
    """'3_function_0_LLC_ASM_globalisel' -> ('3_function_0', 'LLC_ASM_globalisel').
    Both halves contain underscores, so match against the known suffixes."""
    for src in sorted(PIPELINE_MAP, key=len, reverse=True):
        if stem.endswith("_" + src):
            return stem[: -len(src) - 1], src
    return stem, None


def main():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "--stats-dir",
        type=Path,
        default=SCRIPT_DIR / "results" / "gem5" / "stats",
    )
    parser.add_argument(
        "--out-root",
        type=Path,
        default=SCRIPT_DIR / "results" / "gem5",
    )
    args = parser.parse_args()

    files = sorted(args.stats_dir.glob("*.stats.txt"))
    if not files:
        sys.exit(f"no *.stats.txt in {args.stats_dir}")

    written = skipped = 0
    per_pipe = {}
    for f in files:
        stem = f.name[: -len(".stats.txt")]
        bench, src = split_name(stem)
        if src is None:
            print(f"warning: {f.name}: unknown pipeline, skipped", file=sys.stderr)
            skipped += 1
            continue

        text = f.read_text()
        insts = first_stat(text, "simInsts")
        cycles = first_stat(text, "system.cpu.numCycles")
        uops = first_stat(text, "simOps")
        if insts is None or cycles is None:
            print(f"warning: {f.name}: missing stats, skipped", file=sys.stderr)
            skipped += 1
            continue
        if uops is None:
            uops = insts

        plot_name = PIPELINE_MAP[src]
        out_dir = args.out_root / plot_name
        out_dir.mkdir(parents=True, exist_ok=True)
        (out_dir / f"{bench}.out").write_text(
            "# gem5 TimingSimpleCPU, measured region "
            "(m5_reset_stats..m5_dump_stats).\n"
            "# llvm-mca .out layout so utils.plot.parse_mca_file can read it;\n"
            "# values are the true gem5 totals x100 (parse divides by 100).\n"
            f"Iterations:        {MCA_ITERATIONS}\n"
            f"Instructions:      {insts * MCA_ITERATIONS}\n"
            f"Total Cycles:      {cycles * MCA_ITERATIONS}\n"
            f"Total uOps:        {uops * MCA_ITERATIONS}\n"
        )
        written += 1
        per_pipe[plot_name] = per_pipe.get(plot_name, 0) + 1

    print(f"wrote {written} .out files, skipped {skipped}")
    for p in sorted(per_pipe):
        print(f"  {args.out_root / p}: {per_pipe[p]} files")


if __name__ == "__main__":
    main()
