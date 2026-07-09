#!/usr/bin/env python3

import argparse
import math
import subprocess
import sys
from pathlib import Path

import pandas as pd

from utils.plot import (
    upload_to_zulip,
    setup_plotting_directories,
    light_blue,
)
from utils.lib import (
    root_dir,
    machine_username,
    machine_hostname,
    machine_uname,
    git_hash,
)

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt

ROOT_DIR_PATH = Path(
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"]).decode().strip()
)

# Per-variant cycles_raw.csv inputs, produced by earlier runs of this script
# against the optimized / unoptimized VeIR results.
DATA_OPT = ROOT_DIR_PATH / "real-benchmarks" / "data-optimized"
DATA_UNOPT = ROOT_DIR_PATH / "real-benchmarks" / "data-unoptimized"
DATA_DIR = ROOT_DIR_PATH / "real-benchmarks" / "data"
PLOTS_DIR = ROOT_DIR_PATH / "real-benchmarks" / "plots"

# Table columns, in order. The two VeIR variants come from DATA_OPT/DATA_UNOPT;
# GlobalISel and SelectionDAG are identical in both and taken from DATA_OPT.
PIPELINES = [
    "VEIR_UNOPT",
    "VEIR_OPT",
    "LLC_ASM_globalisel",
    "LLC_ASM_selectiondag",
]
BASELINE = "LLC_ASM_selectiondag"

PIPELINE_LABELS = {
    "VEIR_OPT": "Veir (optimized)",
    "VEIR_UNOPT": "Veir (unoptimized)",
    "LLC_ASM_globalisel": "GlobalISel",
    "LLC_ASM_selectiondag": "SelectionDAG",
}


def collect_cycles(data_opt, data_unopt):
    """Build the benchmark x pipeline cycles DataFrame by merging the two
    per-variant cycles_raw.csv files: the VEIR_REGALLOC_ASM column of each
    becomes VEIR_OPT / VEIR_UNOPT; GlobalISel/SelectionDAG (identical across
    the two) come from the optimized file. Columns follow PIPELINES order."""
    for d in (data_opt, data_unopt):
        if not (d / "cycles_raw.csv").is_file():
            sys.exit(f"missing {d / 'cycles_raw.csv'}")

    df_opt = pd.read_csv(data_opt / "cycles_raw.csv").rename(
        columns={"VEIR_REGALLOC_ASM": "VEIR_OPT"}
    )
    df_unopt = pd.read_csv(data_unopt / "cycles_raw.csv").rename(
        columns={"VEIR_REGALLOC_ASM": "VEIR_UNOPT"}
    )[["benchmark", "VEIR_UNOPT"]]

    df = df_opt.merge(df_unopt, on="benchmark", how="outer")
    cols = ["benchmark"] + [p for p in PIPELINES if p in df.columns]
    return df[cols]


def compute_ratios(df_cycles, pipelines, baseline):
    """Per-benchmark ratio pipeline/baseline plus the geometric mean of those
    ratios per pipeline. Returns (df_ratios, geomeans)."""
    pipes = [p for p in pipelines if p in df_cycles.columns]
    ratios = {"benchmark": df_cycles["benchmark"]}
    for p in pipes:
        ratios[p] = df_cycles[p] / df_cycles[baseline]
    df_ratios = pd.DataFrame(ratios)

    geomeans = {}
    for p in pipes:
        vals = [r for r in df_ratios[p] if pd.notna(r) and r > 0]
        geomeans[p] = (
            math.exp(sum(math.log(r) for r in vals) / len(vals)) if vals else float("nan")
        )
    return df_ratios, geomeans


def _fmt_ratio(r):
    """One significant decimal digit, e.g. 0.9x / 1.1x."""
    return "n/a" if pd.isna(r) else f"{r:.1f}x"


def _cycle_cell(cycles, ratio):
    if pd.isna(cycles):
        return "FAIL"
    return f"{int(cycles)} ({_fmt_ratio(ratio)})"


def latex_table(df_cycles, df_ratios, geomeans, pipelines, label):
    """Booktabs table: one column per pipeline showing `<cycles> (<ratio>x)`,
    with a trailing geomean row (ratios only)."""
    pipes = [p for p in pipelines if p in df_cycles.columns]
    col_headers = " & ".join(rf"\textbf{{{PIPELINE_LABELS[p]}}}" for p in pipes)
    ratio_by_bench = df_ratios.set_index("benchmark")

    n = len(pipes)
    # Leading serial-number column, then benchmark, then one column per pipeline.
    lines = [
        r"    \centering",
        r"    \footnotesize",
        rf"    \begin{{tabular}}{{r l {'r ' * n}}}",
        r"        \toprule",
        rf"        & & \multicolumn{{{n}}}{{c}}{{\textbf{{\#Cycles (ratio vs.\ SelectionDAG)}}}} \\",
        rf"        \cmidrule(lr){{3-{n + 2}}}",
        rf"        \textbf{{\#}} & \textbf{{Benchmark}} & {col_headers} \\",
        r"        \midrule",
    ]

    for i, (_, row) in enumerate(df_cycles.iterrows(), start=1):
        bench = row["benchmark"]
        cells = [
            _cycle_cell(row[p], ratio_by_bench.loc[bench, p]) for p in pipes
        ]
        name = bench.replace("_", r"\_")
        lines.append(rf"        {i} & \texttt{{{name}}} & {' & '.join(cells)} \\")

    geo_cells = [_fmt_ratio(geomeans.get(p)) for p in pipes]
    lines += [
        r"        \midrule",
        rf"        & \textbf{{geomean}} & {' & '.join(geo_cells)} \\",
        r"        \bottomrule",
        r"    \end{tabular}",
        rf"    \label{{{label}}}",
    ]
    return "\n".join(lines)


def render_table_as_png(df_cycles, df_ratios, geomeans, pipelines, title, filepath):
    """Render the same `<cycles> (<ratio>x)` table (with geomean row) as a PNG."""
    plt.rcParams["font.family"] = ["Ubuntu", "Nimbus Sans", "sans-serif"]

    pipes = [p for p in pipelines if p in df_cycles.columns]
    col_headers = ["#", "Benchmark"] + [PIPELINE_LABELS[p] for p in pipes]
    ratio_by_bench = df_ratios.set_index("benchmark")

    table_rows = []
    for i, (_, row) in enumerate(df_cycles.iterrows(), start=1):
        bench = row["benchmark"]
        cells = [_cycle_cell(row[p], ratio_by_bench.loc[bench, p]) for p in pipes]
        table_rows.append([str(i), bench] + cells)
    table_rows.append(["", "geomean"] + [_fmt_ratio(geomeans.get(p)) for p in pipes])

    fig, ax = plt.subplots(figsize=(10, max(1.5, len(table_rows) * 0.6 + 1.2)))
    ax.axis("off")

    tbl = ax.table(
        cellText=table_rows,
        colLabels=col_headers,
        cellLoc="center",
        loc="center",
    )
    tbl.auto_set_font_size(False)
    tbl.set_fontsize(13)
    tbl.scale(1.2, 2.0)

    for j in range(len(col_headers)):
        tbl[0, j].set_text_props(fontweight="bold")
        tbl[0, j].set_facecolor(light_blue)

    ax.set_title(title, fontsize=14, pad=12)

    plt.tight_layout()
    plt.savefig(filepath, bbox_inches="tight", dpi=150)
    plt.close()


def main(upload=True):
    setup_plotting_directories(DATA_DIR, PLOTS_DIR)

    df_cycles = collect_cycles(DATA_OPT, DATA_UNOPT)
    if df_cycles.empty:
        print(f"No benchmarks found in {DATA_OPT} / {DATA_UNOPT}", file=sys.stderr)
        sys.exit(1)
    if BASELINE not in df_cycles.columns:
        print(f"baseline {BASELINE!r} missing from inputs", file=sys.stderr)
        sys.exit(1)

    df_ratios, geomeans = compute_ratios(df_cycles, PIPELINES, BASELINE)

    # Order rows by ascending unoptimized-VeIR ratio (smallest ratio on top).
    # df_cycles and df_ratios share an index, so reorder both to keep aligned.
    veir = "VEIR_UNOPT"
    if veir in df_ratios.columns:
        order = df_ratios.sort_values(veir, kind="stable").index
        df_cycles = df_cycles.loc[order].reset_index(drop=True)
        df_ratios = df_ratios.loc[order].reset_index(drop=True)

    # CSV: raw cycles, and ratios with a trailing geomean row.
    df_cycles.to_csv(DATA_DIR / "cycles_raw.csv", index=False)
    geo_row = {"benchmark": "geomean", **{p: geomeans[p] for p in geomeans}}
    ratios_out = pd.concat(
        [df_ratios, pd.DataFrame([geo_row])], ignore_index=True
    )
    ratios_out.to_csv(DATA_DIR / "cycles_ratios.csv", index=False)
    print(f"Written {DATA_DIR / 'cycles_raw.csv'}")
    print(f"Written {DATA_DIR / 'cycles_ratios.csv'}")

    tex_path = DATA_DIR / "cycles_ratio_table_real.tex"
    tex_path.write_text(
        latex_table(
            df_cycles, df_ratios, geomeans, PIPELINES, "cycles_ratio_table_real"
        )
    )
    print(f"Written {tex_path}")

    png_path = DATA_DIR / "cycles_ratio_table_real.png"
    render_table_as_png(
        df_cycles,
        df_ratios,
        geomeans,
        PIPELINES,
        "#Cycles per iteration (ratio vs SelectionDAG)",
        png_path,
    )
    print(f"Written {png_path}")

    if not upload:
        print("Skipping Zulip upload (--no-upload).")
        return

    upload_to_zulip(
        root_dir(),
        machine_username(),
        machine_hostname(),
        machine_uname(),
        git_hash(),
        ["Real benchmarks - #Cycles, VeIR / GlobalISel vs. SelectionDAG"],
        [png_path],
    )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="table-real",
        description="Build the #Cycles (ratio vs SelectionDAG) table for real benchmarks.",
    )
    parser.add_argument(
        "--no-upload",
        action="store_true",
        help="Write CSV/TeX/PNG tables locally but do not upload to Zulip.",
    )
    args = parser.parse_args()
    main(upload=not args.no_upload)
