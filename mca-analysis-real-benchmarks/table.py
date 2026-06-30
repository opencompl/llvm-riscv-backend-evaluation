#!/usr/bin/env python3

import os
import subprocess
import sys
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

ROOT_DIR_PATH = Path(
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode()
    .strip()
)

RESULTS_DIR = ROOT_DIR_PATH / "mca-analysis-real-benchmarks" / "results"

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


def parse_mca_file(path):
    """Return (instructions, cycles, uops) per iteration from a .out file."""
    instructions = cycles = uops = None
    with open(path) as f:
        for line in f:
            if line.startswith("Instructions:"):
                instructions = int(line.split()[-1]) // ITERATIONS
            elif line.startswith("Total Cycles:"):
                cycles = int(line.split()[-1]) // ITERATIONS
            elif line.startswith("Total uOps:"):
                uops = int(line.split()[-1]) // ITERATIONS
    return instructions, cycles, uops


def collect_data():
    """Return {benchmark_name: {pipeline: (instructions, cycles, uops)}}."""
    data = {}
    for pipeline, directory in PIPELINES.items():
        if not directory.exists():
            continue
        for path in sorted(directory.glob("*.out")):
            name = path.stem
            data.setdefault(name, {})[pipeline] = parse_mca_file(path)
    return data


def latex_table(data, metric_index, metric_label, caption, label):
    """
    Emit a LaTeX figure+tabular block.  metric_index: 0=instructions, 1=cycles, 2=uops.
    """
    pipeline_order = ["LLVM_globalisel", "LLVM_selectiondag", "VEIR"]
    col_headers = " & ".join(
        rf"\textbf{{{PIPELINE_LABELS[p]}}}" for p in pipeline_order
    )

    lines = [
        r"    \centering",
        r"    \footnotesize",
        rf"    \begin{{tabular}}{{l {'r ' * len(pipeline_order)}}}",
        r"        \toprule",
        rf"        \textbf{{Benchmark}} & {col_headers} \\",
        r"        \midrule",
    ]

    complete = [
        (name, row)
        for name, row in sorted(data.items())
        if all(p in row for p in pipeline_order)
    ]

    for name, row_data in complete:
        values = []
        for p in pipeline_order:
            v = row_data[p][metric_index]
            values.append(str(v) if v is not None else "--")
        lines.append(rf"        {name} & {' & '.join(values)} \\")

    lines += [
        r"        \bottomrule",
        r"    \end{tabular}",
        rf"    \caption{{{caption}}}",
        rf"    \label{{{label}}}",
    ]
    return "\n".join(lines)


def render_table_as_png(data, metric_index, title, filepath):
    """Render the table data as a PNG image using matplotlib."""
    pipeline_order = ["LLVM_globalisel", "LLVM_selectiondag", "VEIR"]
    col_labels = ["Benchmark"] + [PIPELINE_LABELS[p] for p in pipeline_order]

    rows = [
        [name] + [
            str(row[p][metric_index]) if row[p][metric_index] is not None else "--"
            for p in pipeline_order
        ]
        for name, row in sorted(data.items())
        if all(p in row for p in pipeline_order)
    ]

    fig, ax = plt.subplots(figsize=(8, max(1.5, len(rows) * 0.6 + 1.2)))
    ax.axis("off")

    tbl = ax.table(
        cellText=rows,
        colLabels=col_labels,
        cellLoc="center",
        loc="center",
    )
    tbl.auto_set_font_size(False)
    tbl.set_fontsize(13)
    tbl.scale(1.2, 2.0)

    for j in range(len(col_labels)):
        tbl[0, j].set_text_props(fontweight="bold")
        tbl[0, j].set_facecolor("#e0e0e0")

    ax.set_title(title, fontsize=14, pad=12)

    plt.tight_layout()
    plt.savefig(filepath, bbox_inches="tight", dpi=150)
    plt.close()


def main():
    data = collect_data()
    if not data:
        print("No .out files found.", file=sys.stderr)
        sys.exit(1)

    data_dir = ROOT_DIR_PATH / "mca-analysis-real-benchmarks" / "data"
    data_dir.mkdir(exist_ok=True)

    tables = [
        (
            "tot_instructions_table_real.tex",
            latex_table(
                data,
                metric_index=0,
                metric_label="instructions",
                caption="\#instructions per iteration.",
                label="tab:real-instructions",
            ),
        ),
        (
            "num_cycles_table_real.tex",
            latex_table(
                data,
                metric_index=1,
                metric_label="cycles",
                caption="\#cycles per iteration.",
                label="tab:real-cycles",
            ),
        ),
    ]

    png_tables = [
        (
            "tot_instructions_table_real.png",
            0,
            "#Instructions per iteration",
        ),
        (
            "num_cycles_table_real.png",
            1,
            "#Cycles per iteration",
        ),
    ]

    for filename, content in tables:
        path = data_dir / filename
        path.write_text(content + "\n")
        print(f"Written {path}")

    for filename, metric_index, title in png_tables:
        path = data_dir / filename
        render_table_as_png(data, metric_index, title, path)
        print(f"Written {path}")


if __name__ == "__main__":
    main()
