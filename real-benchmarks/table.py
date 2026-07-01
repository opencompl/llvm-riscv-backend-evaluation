#!/usr/bin/env python3

import subprocess
import sys
from pathlib import Path
import pandas as pd
from utils.plot import (
    upload_to_zulip,
    collect_data,
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

RESULTS_DIR = ROOT_DIR_PATH / "real-benchmarks" / "results"

PIPELINES = {
    "LLVM_globalisel": RESULTS_DIR / "LLVM_globalisel",
    "LLVM_selectiondag": RESULTS_DIR / "LLVM_selectiondag",
    "VEIR": RESULTS_DIR / "VEIR",
}

PIPELINE_LABELS = {
    "LLVM_globalisel": "GlobalISel",
    "LLVM_selectiondag": "SelectionDAG",
    "VEIR": "VeIR",
}

ITERATIONS = 100


def latex_table(df, caption, label):
    """
    Emit a LaTeX figure+tabular block.  metric_index: 0=instructions, 1=cycles, 2=uops.
    """
    col_headers = " & ".join(
        rf"\textbf{{{PIPELINE_LABELS[p]}}}" for p in PIPELINES.keys()
    )

    lines = [
        r"    \centering",
        r"    \footnotesize",
        rf"    \begin{{tabular}}{{l {'r ' * len(PIPELINES)}}}",
        r"        \toprule",
        rf"        \textbf{{Benchmark}} & {col_headers} \\",
        r"        \midrule",
    ]

    for name, row in df.iterrows():
        values = [
            str(row[p]) if p in row and pd.notna(row[p]) else "FAIL"
            for p in PIPELINES.keys()
        ]
        lines += [rf"        {name} & {' & '.join(values)} \\"]

    lines += [
        r"        \bottomrule",
        r"    \end{tabular}",
        rf"    \caption{{{caption}}}",
        rf"    \label{{{label}}}",
    ]

    return "\n".join(lines)


def render_table_as_png(df, title, filepath):
    """Render the table data as a PNG image using matplotlib."""

    plt.rcParams["font.family"] = ["Ubuntu", "Nimbus Sans", "sans-serif"]

    table_rows = []

    col_headers = ["Benchmark"] + [PIPELINE_LABELS[p] for p in PIPELINES.keys()]

    for name, row in df.iterrows():
        values = [
            str(int(row[p])) if p in row and pd.notna(row[p]) else "FAIL"
            for p in PIPELINES.keys()
        ]
        table_rows.append([name] + values)

    fig, ax = plt.subplots(figsize=(8, max(1.5, len(table_rows) * 0.6 + 1.2)))
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


def main():

    setup_plotting_directories(
        ROOT_DIR_PATH / "real-benchmarks" / "data",
        ROOT_DIR_PATH / "real-benchmarks" / "plots",
    )
    df_instructions, df_cycles, df_uops = collect_data(PIPELINES)

    df_instructions.to_csv(
        ROOT_DIR_PATH / "real-benchmarks" / "data" / "raw_instruction.csv", index=False
    )
    df_cycles.to_csv(
        ROOT_DIR_PATH / "real-benchmarks" / "data" / "raw_cycles.csv", index=False
    )
    df_uops.to_csv(
        ROOT_DIR_PATH / "real-benchmarks" / "data" / "raw_uops.csv", index=False
    )

    if df_instructions.empty or df_cycles.empty or df_uops.empty:
        print("No .out files found.", file=sys.stderr)
        sys.exit(1)

    data_dir = ROOT_DIR_PATH / "real-benchmarks" / "data"
    data_dir.mkdir(exist_ok=True)

    png_tables = [
        (
            df_cycles,
            "num_cycles_table_real.png",
            "#Cycles per iteration",
        ),
        (
            df_instructions,
            "tot_instructions_table_real.png",
            "#Instructions per iteration",
        ),
    ]

    plots = []

    for data, filename, title in png_tables:
        path = data_dir / filename
        render_table_as_png(data, title, path)
        plots.append(path)
        print(f"Written {path}")

    upload_to_zulip(
        root_dir(),
        machine_username(),
        machine_hostname(),
        machine_uname(),
        git_hash(),
        [
            "Real benchmarks - #Cycles, Veir-LLVM vs. selectionDAG ",
            "Real benchmarks - #Instructions, Veir-LLVM vs. selectionDAG ",
        ],
        plots,
    )


if __name__ == "__main__":
    main()
