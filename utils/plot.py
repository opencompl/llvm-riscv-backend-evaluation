#!/usr/bin/env python3

import subprocess
import os
import sys
import shutil
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
from matplotlib.ticker import ScalarFormatter, NullFormatter, LogLocator
import numpy as np
import math
import logging
from num2words import num2words
from utils import upload_zulip
from datetime import datetime

matplotlib.rcParams["pdf.fonttype"] = 42
matplotlib.rcParams["font.size"] = 20


matplotlib.rcParams["figure.autolayout"] = True
matplotlib.rcParams["legend.frameon"] = False
matplotlib.rcParams["axes.spines.right"] = False
matplotlib.rcParams["axes.spines.top"] = False

# matplotlib.rcParams['figure.figsize'] = 5, 2

light_gray = "#cacaca"
dark_gray = "#827b7b"
light_blue = "#a6cee3"
dark_blue = "#1f78b4"
light_green = "#b2df8a"
dark_green = "#33a02c"
light_red = "#fb9a99"
dark_red = "#e31a1c"
black = "#000000"
white = "#ffffff"

colors_list = [
    light_gray,
    dark_gray,
    light_blue,
    dark_blue,
    light_green,
    dark_green,
    light_red,
    dark_red,
    black,
    white,
]


def setup_plotting_directories(data_dir, plots_dir):
    """
    Create clean directories to store the benchmarks.
    """
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    else:
        shutil.rmtree(data_dir)
        os.makedirs(data_dir)

    if not os.path.exists(plots_dir):
        os.makedirs(plots_dir)
    else:
        shutil.rmtree(plots_dir)
        os.makedirs(plots_dir)


parameters_labels = {
    "tot_instructions": "#Instructions",
    "tot_cycles": "#Cycles",
    "tot_uops": "#uOps",
    "similarity": "Instructions List:",
}

selector_labels = {
    "VEIR_llvm": "VeIR-LLVM",
    "LLVM_globalisel_O1": "GlobalISel (O1)",
    "LLVM_globalisel_O2": "GlobalISel (O2)",
    "LLVM_globalisel_O3": "GlobalISel (O3)",
    "LLVM_globalisel": "GlobalISel",
    "LLVM_selectiondag_O1": "SelectionDAG (O1)",
    "LLVM_selectiondag_O2": "SelectionDAG (O2)",
    "LLVM_selectiondag_O3": "SelectionDAG (O3)",
    "LLVM_selectiondag": "SelectionDAG",
}


def parse_mca_file(path):
    """Return (instructions_per_iter, total_cycles, uops_per_iter) from a .out file."""
    instructions = total_cycles = uops = None
    with open(path) as f:
        for line in f:
            if line.startswith("Instructions:"):
                instructions = int(line.split()[-1]) // 100
            elif line.startswith("Total Cycles:"):
                total_cycles = int(line.split()[-1]) // 100
            elif line.startswith("Total uOps:"):
                uops = int(line.split()[-1]) // 100
    return instructions, total_cycles, uops

def collect_data(PIPELINES):
    """Return three DataFrames (instructions, cycles, uops), each with a
    "benchmark" column holding the benchmark name and one column per
    pipeline (NaN if that pipeline has no result for that benchmark)."""
    instructions, cycles, uops = {}, {}, {}
    for pipeline, directory in PIPELINES.items():
        if not directory.exists():
            continue
        for path in sorted(directory.glob("*.out")):
            name = path.stem
            i, c, u = parse_mca_file(path)
            instructions.setdefault(name, {})[pipeline] = i
            cycles.setdefault(name, {})[pipeline] = c
            uops.setdefault(name, {})[pipeline] = u
    return (
        pd.DataFrame.from_dict(instructions, orient="index").rename_axis("benchmark").reset_index(),
        pd.DataFrame.from_dict(cycles, orient="index").rename_axis("benchmark").reset_index(),
        pd.DataFrame.from_dict(uops, orient="index").rename_axis("benchmark").reset_index(),
    )


def scatter_plot(parameter, selector1, selector2, data_dir, plots_dir):
    df = pd.read_csv(data_dir + parameter + ".csv")

    if selector1 + "_" + parameter not in df.columns:
        print(f"Error: the column {selector1} does not exist in the dataframe.")
        return
    if selector2 + "_" + parameter not in df.columns:
        print(f"Error: the column {selector2} does not exist in the dataframe.")

    df_plot_comparison = df[
        [selector1 + "_" + parameter, selector2 + "_" + parameter]
    ].dropna()

    frequencies = (
        df_plot_comparison.groupby(
            [selector1 + "_" + parameter, selector2 + "_" + parameter]
        )
        .size()
        .reset_index(name="Frequency")
    )
    df_plot_scaled = pd.merge(
        df_plot_comparison,
        frequencies,
        on=[selector1 + "_" + parameter, selector2 + "_" + parameter],
        how="left",
    )

    df_plot_scaled["Scaled_Size"] = np.sqrt((df_plot_scaled["Frequency"])) * 50 + 20

    plt.scatter(
        df_plot_scaled[selector1 + "_" + parameter],
        df_plot_scaled[selector2 + "_" + parameter],
        s=df_plot_scaled["Scaled_Size"],
        color=light_blue,
        alpha=0.7,
        edgecolors="w",
        label="Function data points (Size by frequency)",
    )

    min_val = min(
        df_plot_comparison[selector1 + "_" + parameter].min(),
        df_plot_comparison[selector2 + "_" + parameter].min(),
    )
    max_val = max(
        df_plot_comparison[selector1 + "_" + parameter].max(),
        df_plot_comparison[selector2 + "_" + parameter].max(),
    )
    # Add a small buffer to the min/max values for better visualization
    plot_min = max(0, min_val - 1)
    plot_max = max_val + 1

    plt.plot(
        [plot_min, plot_max],
        [plot_min, plot_max],
        color="gray",
        linestyle="--",
        label="$x=y$ line",
    )

    plt.xlabel(selector_labels[selector1] + " - " + parameters_labels[parameter])
    plt.ylabel(selector_labels[selector2] + " - " + parameters_labels[parameter])

    if (
        not (plot_min == plot_max)
        and (0 < int(plot_min / 5))
        and (0 < int(plot_max / 5))
    ):
        plt.xlim(plot_min, plot_max)
        plt.ylim(plot_min, plot_max)

        plt.xticks(range(0, int(plot_max), int((plot_max) / 5)))
        plt.yticks(range(0, int(plot_max), int((plot_max) / 5)))

    plt.gca().set_aspect("equal", adjustable="box")

    plt.tight_layout()

    pdf_filename = (
        plots_dir + f"{parameter}_scatter_plot_{selector1}_vs_{selector2}.pdf"
    )
    plt.savefig(pdf_filename, bbox_inches="tight")
    # print(f"\nScatter plot saved to '{pdf_filename}' in the current working directory.")
    plt.close()


def stacked_bar_plot_perc(df, parameter, selector1, selector2, data_dir, plots_dir):

    if selector1 not in df.columns:
        print(f"Error: the column {selector1} does not exist in the dataframe.")
        return
    if selector2 not in df.columns:
        print(f"Error: the column {selector2} does not exist in the dataframe.")
        return

    # Compute the ratio between the two columns and classify them
    df["diff"] = df[selector1] / df[selector2]
    df["diff_class"] = df["diff"].apply(classify)
    
    # For each unique value of the initial `instructions_number`, compute the % of each diff_class
    group = (
        df.groupby("init_instr")["diff_class"]
        .value_counts(normalize=True)
        .unstack(fill_value=0)
        * 100
    )

    # classify() returns letter codes (A: <1x, B: 1x, C: 1x-1.5x, D: 1.5x-2x, E: >2x)
    class_order = ["<1x", "1x", "1x-1.5x", "1.5x-2x", ">2x"]
    
    # If ratio is `nan` print a failure and return
    if df["diff"].isnull().any():
        print(f"FAILURE: Some ratios are NaN for {parameter} between {selector1} and {selector2}.")
        sys.exit(1)

    # Print the files with ratio < 1
    for instr_num, group_df in df.groupby("init_instr"):
        below_1x = group_df[group_df["diff"] < 1]
        if not below_1x.empty:
            print(f"{selector1} vs. {selector2} {parameter}: {instr_num}, Programs with ratio < 1x:")
            for _, row in below_1x.iterrows():
                print(f"  Benchmark: {row['benchmark']}, Ratio: {row['diff']:.2f}")
                
    # Print the 5 programs with the highest ratio for each initial instruction count
    for instr_num, group_df in df.groupby("init_instr"):
        top_5 = group_df.nlargest(5, "diff")
        print(f"{selector1} vs. {selector2} {parameter}: {instr_num}, Top 5 programs with highest ratio:")
        for _, row in top_5.iterrows():
            print(f"  Benchmark: {row['benchmark']}, Ratio: {row['diff']:.2f}")
            
    reindexed = group.reindex(columns=class_order, fill_value=0.0)
    
    # Colors for each class
    class_colors = {
        "<1x": light_blue,
        "1x": dark_green,
        "1x-1.5x": light_green,
        "1.5x-2x": light_red,
        ">2x": dark_red,
    }

    # Stacked plot: one column per value of `init_instr`, with the % of each diff_class stacked on top of each other
    reindexed.plot(kind="bar", stacked=True, color=[class_colors[c] for c in class_order], figsize=(10, 5))

    plt.xlabel("#Instructions - LLVM IR")
    plt.xticks(rotation=0)
    plt.ylabel(
        f"$\\frac{{\\text{{{parameters_labels[parameter]}{selector_labels[selector1]}}}}}{{\\text{{{parameters_labels[parameter]}{selector_labels[selector2]}}}}}$",
        fontsize=26,
        rotation="horizontal",
        horizontalalignment="left",
        y=1.05,
    )
    plt.legend(title="Ratio", bbox_to_anchor=(1.02, 1), loc="upper left")
    plt.tight_layout()

    pdf_filename = plots_dir + f"stacked_bar_{parameter}_{selector1}_vs_{selector2}.pdf"
    plt.savefig(pdf_filename)
    plt.close()



def violin_plot(df, parameter, selector1, selector2, data_dir, plots_dir):


    if selector1 not in df.columns:
        print(f"Error: the column {selector1} does not exist in the dataframe.")
        return
    if selector2 not in df.columns:
        print(f"Error: the column {selector2} does not exist in the dataframe.")
        return

    df["ratio"] = df[selector1] / df[selector2]


    grouped = df.groupby("init_instr")["ratio"].apply(list).reset_index()
    
    if df["ratio"].isnull().any():
        print(f"FAILURE: Some ratios are NaN for {parameter} between {selector1} and {selector2}.")
        sys.exit(1)
    
    violin_data = grouped["ratio"].values
    positions = grouped["init_instr"].values

    plt.figure(figsize=(10, 5))
    parts = plt.violinplot(violin_data, positions, showmedians=True)

    for pc in parts["bodies"]:
        pc.set_facecolor(light_green)
        pc.set_edgecolor(light_green)
        pc.set_alpha(1.0)

    plt.axhline(1, color=black, linestyle="--", linewidth=1, label="1x")
    plt.text(positions[-1] * 1.08, 1.02, "1x", color=black, ha="center", fontsize=20)

    for partname in ("cbars", "cmins", "cmaxes"):
        if partname in parts:
            parts[partname].set_edgecolor(light_gray)
            parts[partname].set_linewidth(1)
    parts["cmedians"].set_edgecolor(dark_green)

    plt.xlabel("#Instructions - LLVM IR")
    plt.ylabel(
        f"$\\frac{{\\text{{{parameters_labels[parameter]}{selector_labels[selector1]}}}}}{{\\text{{{parameters_labels[parameter]}{selector_labels[selector2]}}}}}$",
        fontsize=26,
        rotation="horizontal",
        horizontalalignment="left",
        y=1.05,
    )
    plt.yticks(np.arange(0, math.ceil(df["ratio"].max()) + 2, 2))

    plt.tight_layout()

    pdf_filename = plots_dir + f"violin_{parameter}_{selector1}_vs_{selector2}.pdf"
    plt.savefig(pdf_filename)
    plt.close()

def classify(x):
    if x < 1:
        return "<1x"
    if x == 1:
        return "1x"
    if x < 1.5:
        return "1x-1.5x"
    if x < 2:
        return "1.5x-2x"
    return ">2x"


def proportional_bar_plot(df, parameter, selector1, selector2, data_dir, plots_dir):

    plt.figure(figsize=(7, 5))


    if selector1 not in df.columns or selector2 not in df.columns:
        print(
            f"Error: One or both columns ({selector1}, {selector2}) do not exist in the dataframe."
        )
        return

    df["ratios"] = df[selector1] / df[selector2]

    average_ratios_by_instruction = (
        df.groupby("init_instr")["ratios"]
        .apply(lambda x: np.exp(np.log(x).mean()))
        .reset_index(name="average_ratio")
    )

    width = 0.8

    plt.bar(
        average_ratios_by_instruction["init_instr"],
        average_ratios_by_instruction["average_ratio"],
        color=light_green,
        width=width,
        label=f"Geomean {parameters_labels[parameter]},$\\frac{{\\text{{{selector_labels[selector1]}}}}}{{\\text{{{selector_labels[selector2]}}}}}$",
    )

    plt.axhline(1, color=black, linestyle="--", linewidth=2)

    plt.xlabel("#Instructions - LLVM IR")

    plt.ylabel(
        f"$\\frac{{\\text{{{parameters_labels[parameter]},{selector_labels[selector1]}}}}}{{\\text{{{parameters_labels[parameter]}{selector_labels[selector2]}}}}}$",
        fontsize=26,
        rotation="horizontal",
        horizontalalignment="left",
        y=1.08,
    )
    
    plt.xticks(average_ratios_by_instruction["init_instr"])
    plt.yticks(np.arange(0, np.ceil(average_ratios_by_instruction["average_ratio"].max()) + 1, 1))

    plt.xticks(np.arange(3, 9, 1))

    plt.tight_layout()

    # uncomment to have numbers on top of the bars
    for bar in plt.gca().patches:
        height = bar.get_height()*1.03
        plt.text(
            bar.get_x() + bar.get_width() / 2.0,
            height,
            f"{height:.2f}",
            ha="center",
            va="bottom",
            color=black,
        )


    pdf_filename = (
        plots_dir + f"proportional_{parameter}_{selector1}_vs_{selector2}.pdf"
    )
    plt.savefig(pdf_filename)
    plt.close()


def proportional_bar_plot_geomean(df, parameter, selector1, selector2, selector3, data_dir, plots_dir):

    plt.figure(figsize=(15, 5))


    if selector1 not in df.columns or selector2 not in df.columns or selector3 not in df.columns:
        print(
            f"Error: One or more columns ({selector1}, {selector2}, {selector3}) do not exist in the dataframe."
        )
        return
    
    df['ratio_21'] = df[selector2]/df[selector1]
    df['ratio_31'] = df[selector3]/df[selector1]
    df['ratio_11'] = df[selector1]/df[selector1]
    
    average_grouped_21 = (
        df.groupby("init_instr")["ratio_21"]
        .apply(lambda x: np.exp(np.log(x).mean()))
        .reset_index(name="average_ratio_21")
    )
    
    average_grouped_31 = (
        df.groupby("init_instr")["ratio_31"]
        .apply(lambda x: np.exp(np.log(x).mean()))
        .reset_index(name="average_ratio_31")
    )
    
    average_grouped_11 = (
        df.groupby("init_instr")["ratio_11"]
        .apply(lambda x: np.exp(np.log(x).mean()))
        .reset_index(name="average_ratio_11")
    )
    
    

    # Grouped horizontal bars: for each init_instr, three bars (one per
    # selector) whose length is the geomean, over that size bucket, of the
    # selector's ratio to selector1. selector1's own bar is 1.0 (baseline).
    # The bar thickness (bar_h) is a bit less than the centre spacing (step),
    # so bars within a group never overlap and groups stay separated.
    init = average_grouped_11["init_instr"].to_numpy()
    bar_h = 0.22
    step = 0.25

    plt.barh(
        init - step,
        average_grouped_11["average_ratio_11"],
        color=light_blue,
        height=bar_h,
        label=selector_labels[selector1],
    )

    plt.barh(
        init,
        average_grouped_21["average_ratio_21"],
        color=dark_green,
        height=bar_h,
        label=selector_labels[selector2],
    )

    plt.barh(
        init + step,
        average_grouped_31["average_ratio_31"],
        color=light_green,
        height=bar_h,
        label=selector_labels[selector3],
    )

    # baseline at ratio = 1
    plt.axvline(1, color=black, linestyle="--", linewidth=1)

    plt.ylabel("#Instructions - LLVM IR")
    plt.yticks(init)
    plt.xlabel(
        f"Geomean {parameters_labels[parameter]} ratio (vs {selector_labels[selector1]})"
    )

    plt.legend()

    plt.tight_layout()

    # numbers at the end of each (horizontal) bar
    for bar in plt.gca().patches:
        value = bar.get_width()
        plt.text(
            value * 1.03,
            bar.get_y() + bar.get_height() / 2.0,
            f"{value:.2f}",
            ha="left",
            va="center",
            color=black,
        )


    pdf_filename = (
        plots_dir + f"proportional_all.pdf"
    )
    plt.savefig(pdf_filename)
    plt.close()



def convert_pdf_to_jpg(pdf_path):
    from pdf2image import convert_from_path

    images = convert_from_path(pdf_path, dpi=150)
    jpg_path = pdf_path.replace(".pdf", ".jpg")
    images[0].save(jpg_path, "JPEG")
    return jpg_path

def compare_mca_diff_all(folder1, folder2):
    """Compare the .out files in two folders."""
    identical_files = 0
    for file1 in sorted(folder1.glob("*.out")):
        file2 = folder2 / file1.name
        if not file2.exists():
            print(f"FAILURE: File {file2} does not exist.")
            sys.exit(1)

        with open(file1) as f1, open(file2) as f2:
            lines1 = f1.readlines()
            lines2 = f2.readlines()

        diff = [line for line in lines1 if line not in lines2]
        if len(diff) == 0:
            identical_files += 1
    perc = (identical_files / len(list(folder1.glob("*.out")))) * 100
    return perc
    
def compare_mca_diff_by_size(folder1, folder2, sizes):
    """Compare the .out files in two folders with the specified sizes."""
    percs = {}
    for size in sizes:
        identical_files = 0
        files_with_size = [file for file in folder1.glob("*.out") if file.name.split("_")[0] == str(size)]
        for file1 in sorted(files_with_size):
            file2 = folder2 / file1.name
            if not file2.exists():
                print(f"FAILURE: File {file2} does not exist.")
                sys.exit(1)

            with open(file1) as f1, open(file2) as f2:
                lines1 = f1.readlines()
                lines2 = f2.readlines()

            diff = [line for line in lines1 if line not in lines2]
            if len(diff) == 0:
                identical_files += 1
        perc = (identical_files / len(files_with_size)) * 100
        percs[size] = perc
    return percs

def compare_mca_diff_performance(df, parameter, selector1, selector2): 
    """Compare the % of identical performance values of two selectors for a given parameter."""
    num_identical = (df[selector1] == df[selector2]).sum()
    perc_identical = (num_identical / len(df)) * 100
    print(f"same performance on {parameter} for {selector1} vs. {selector2} for {perc_identical} programs.")
    return perc_identical
    
def compare_distribution_mca(df, parameter, selector1, selector2):
    """Compare the distribution of performance values of two selectors for a given parameter according to the classsification."""
    df["ratios"] = df[selector1] / df[selector2]
    df["ratios_class"] = df["ratios"].apply(classify)
    distribution = df["ratios_class"].value_counts(normalize=True).sort_index() * 100
    return distribution

def geomean_ratio(df, parameter, selector1, selector2):
    """Compute the geometric mean of the ratio of two selectors for a given parameter."""
    df["ratios"] = df[selector1] / df[selector2]
    geomean = np.exp(np.log(df["ratios"]).mean())
    # print(f"Geomean {selector1}/{selector2} for {parameter}: {geomean}")
    return geomean

def max_ratio(df, parameter, selector1, selector2):
    """Compute the maximum of the ratio of two selectors for a given parameter."""
    df["ratios"] = df[selector1] / df[selector2]
    max_ratio = df["ratios"].max()
    return max_ratio

def min_ratio(df, parameter, selector1, selector2):
    """Compute the minimum of the ratio of two selectors for a given parameter."""
    df["ratios"] = df[selector1] / df[selector2]
    min_ratio = df["ratios"].min()
    return min_ratio
    
def geomean_ratio_by_size(df, parameter, selector1, selector2, sizes):
    """Compute the geometric mean of the ratio of two selectors for a given parameter and sizes."""
    geomeans = {}
    for size in sizes:
        df_size = df[df["init_instr"] == size]
        df_size["ratios"] = df_size[selector1] / df_size[selector2]
        geomean = np.exp(np.log(df_size["ratios"]).mean())
        geomeans[size] = geomean
    return geomeans

def max_ratio_by_size(df, parameter, selector1, selector2, sizes):
    """Compute the maximum of the ratio of two selectors for a given parameter and sizes."""
    max_ratios = {}
    for size in sizes:
        df_size = df[df["init_instr"] == size]
        df_size["ratios"] = df_size[selector1] / df_size[selector2]
        max_ratio = df_size["ratios"].max()
        max_ratios[size] = max_ratio
    return max_ratios

def min_ratio_by_size(df, parameter, selector1, selector2, sizes):
    """Compute the minimum of the ratio of two selectors for a given parameter and sizes."""
    min_ratios = {}
    for size in sizes:
        df_size = df[df["init_instr"] == size]
        df_size["ratios"] = df_size[selector1] / df_size[selector2]
        min_ratio = df_size["ratios"].min()
        min_ratios[size] = min_ratio
    return min_ratios
    
def create_latex_command(file, commands):
    """Create a LaTeX command to store the value of a variable."""
    for name, value in commands.items():
        with open(file, "a") as f:
            f.write(f"\\newcommand{{\\{name}}}{{{float(value):.2f}}}\n")

def upload_to_zulip(
    lib_root_dir,
    lib_machine_username,
    lib_machine_hostname,
    lib_machine_uname,
    lib_git_hash,
    captions,
    plots,
):
    client = upload_zulip.Client(lib_root_dir / "zuliprc")
    builder = upload_zulip.ContentBuilder()

    builder.add_info(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    builder.add_info(
        f"Machine(`{lib_machine_username}@{lib_machine_hostname}`): `{lib_machine_uname}`"
    )
    builder.add_info(f"Upload from repository git hash `{lib_git_hash}`")

    for c, p in zip(captions, plots):
        builder.add_image(c, p)

    out = builder.build(client)

    dry_run = False
    if dry_run:
        logging.info("--- Upload ---")
        logging.info(out)
        logging.info("---")
    else:
        client.send_message(
            {
                "type": "stream",
                "to": "Project - Lean4  - RISCV backend verification",
                "topic": "EvalBot",
                "content": out,
            }
        )
