#!/usr/bin/env python3
"""
compare_results.py -- pivot the per-run gem5 stats produced by bench.py
(results/<benchmark>_<pipeline>.stats.txt) into a benchmark x pipeline
comparison table, with each pipeline's overhead relative to a baseline.

Values come from the FIRST statistics dump in each file, i.e. the region
between m5_reset_stats() and m5_dump_stats() -- the measured kernel loop
only, excluding harness setup and the correctness check.

Usage:
  ./compare_results.py                      # results/, cycles, vs selectiondag
  ./compare_results.py --stat simInsts
  ./compare_results.py --baseline LLC_ASM_globalisel
  ./compare_results.py results/ --csv comparison.csv
"""

import argparse
import csv
import math
import re
import sys
from collections import defaultdict
from pathlib import Path

PIPELINES = [
    "LLC_ASM_globalisel",
    "LLC_ASM_selectiondag",
    "VEIR_REGALLOC_ASM",
    "VEIR_OPT_REGALLOC_ASM",
]


def extract_stat(path: Path, stat_name: str):
    """Value of `stat_name` in the FIRST stats dump of a gem5 stats.txt
    (the m5_reset_stats..m5_dump_stats region), or None if absent."""
    pattern = re.compile(r"^\s*" + re.escape(stat_name) + r"\s+([-\d.eE+]+)\b")
    with path.open() as f:
        for line in f:
            m = pattern.match(line)
            if m:
                value = m.group(1)
                try:
                    return int(value)
                except ValueError:
                    return float(value)
    return None


def split_name(stem: str, pipelines):
    """'libdivide_s64_recover_LLC_ASM_globalisel' -> (benchmark, pipeline).
    Both halves contain underscores, so match on the known pipeline names."""
    for p in sorted(pipelines, key=len, reverse=True):
        if stem.endswith("_" + p):
            return stem[: -len(p) - 1], p
    return stem, None


def main():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "results_dir",
        type=Path,
        nargs="?",
        default=Path(__file__).resolve().parent / "results",
        help="directory containing <benchmark>_<pipeline>.stats.txt "
        "(default: real-benchmarks/results/)",
    )
    parser.add_argument(
        "--stat",
        default="system.cpu.numCycles",
        help="stat to compare (default: system.cpu.numCycles)",
    )
    parser.add_argument(
        "--pipelines",
        nargs="+",
        default=PIPELINES,
        help="pipeline names (used to parse filenames and order columns)",
    )
    parser.add_argument(
        "--baseline",
        default="LLC_ASM_selectiondag",
        help="pipeline that ratios are computed against",
    )
    parser.add_argument(
        "--csv", type=Path, default=None, help="also write a CSV file"
    )
    args = parser.parse_args()

    if args.baseline not in args.pipelines:
        sys.exit(f"baseline {args.baseline!r} not in --pipelines")

    files = sorted(args.results_dir.glob("*.stats.txt"))
    if not files:
        sys.exit(f"No *.stats.txt files in {args.results_dir}")

    table = defaultdict(dict)
    for f in files:
        stem = f.name[: -len(".stats.txt")]
        bench, pipe = split_name(stem, args.pipelines)
        if pipe is None:
            print(f"warning: {f.name}: unknown pipeline, skipped", file=sys.stderr)
            continue
        table[bench][pipe] = extract_stat(f, args.stat)

    benches = sorted(table)
    pipes = [p for p in args.pipelines if any(p in table[b] for b in benches)]

    # Header: absolute value + ratio-vs-baseline per pipeline
    name_w = max([len(b) for b in benches] + [len("Benchmark")])
    col_w = max([len(p) + 8 for p in pipes] + [14])

    print(f"stat: {args.stat}   (measured region; ratio vs {args.baseline})\n")
    header = f"{'Benchmark':<{name_w}}" + "".join(
        f" | {p:>{col_w}}" for p in pipes
    )
    print(header)
    print("-" * len(header))

    ratios = defaultdict(list)
    rows = []
    for b in benches:
        cells = []
        base = table[b].get(args.baseline)
        for p in pipes:
            v = table[b].get(p)
            if v is None:
                cells.append(f"{'n/a':>{col_w}}")
            elif base and p != args.baseline:
                ratio = v / base
                ratios[p].append(ratio)
                cells.append(f"{v:>{col_w - 9}} ({ratio:5.2f}x)")
            else:
                cells.append(f"{v:>{col_w - 9}} ( 1.00x)")
        print(f"{b:<{name_w}}" + "".join(f" | {c}" for c in cells))
        rows.append([b] + [table[b].get(p) for p in pipes])

    print("-" * len(header))
    geo_cells = []
    for p in pipes:
        if p == args.baseline:
            geo_cells.append(f"{'1.00x':>{col_w}}")
        elif ratios[p]:
            g = math.exp(sum(math.log(r) for r in ratios[p]) / len(ratios[p]))
            geo_cells.append(f"{g:>{col_w - 1}.2f}x")
        else:
            geo_cells.append(f"{'n/a':>{col_w}}")
    print(f"{'geomean':<{name_w}}" + "".join(f" | {c}" for c in geo_cells))

    if args.csv:
        with args.csv.open("w", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(["benchmark"] + pipes)
            writer.writerows(rows)
        print(f"\nWrote {args.csv}")


if __name__ == "__main__":
    main()
