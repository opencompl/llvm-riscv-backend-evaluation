#!/usr/bin/env python3

import subprocess
import os
import sys
import shutil
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
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
    "VEIR_xdsl": "VeIR-xDSL",
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

    # Colors for each class
    class_colors = {
        "<1x": light_blue,
        "1x": dark_green,
        "1x-1.5x": light_green,
        "1.5x-2x": light_red,
        ">2x": dark_red,
    }

    # Stacked plot: one column per value of `init_instr`, with the % of each diff_class stacked on top of each other
    group.plot(kind="bar", stacked=True, color=[class_colors[c] for c in class_order], figsize=(10, 5))

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


def convert_pdf_to_jpg(pdf_path):
    from pdf2image import convert_from_path

    images = convert_from_path(pdf_path, dpi=150)
    jpg_path = pdf_path.replace(".pdf", ".jpg")
    images[0].save(jpg_path, "JPEG")
    return jpg_path

def compare_mca_diff_all(folder1, folder2):
    """Compare the .out files in two folders and print the differences."""
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
    print(f"Percentage of identical files, {folder1.name} vs {folder2.name}: {perc:.2f}%")
    
def compare_mca_diff_by_size(folder1, folder2, sizes):
    """Compare the .out files in two folders and print the differences."""
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
        print(f"Percentage of identical files, {folder1.name} vs {folder2.name}, size {size}: {perc:.2f}%")

def compare_mca_diff_performance(df, parameter, selector1, selector2): 
    num_identical = (df[selector1] == df[selector2]).sum()
    perc_identical = (num_identical / len(df)) * 100
    print(f"Percentage of identical {parameter} values, {selector1} vs {selector2}: {perc_identical:.2f}%")

def create_latex_command(param_dfs, filename, ROOT_DIR_PATH, VEIR_PIPELINES):
    f = open(filename, "w")

    git_command = ["git", "rev-parse", "--short", "HEAD"]
    result = subprocess.run(
        git_command, cwd=ROOT_DIR_PATH, capture_output=True, text=True, check=True
    )

    commit_hash = result.stdout.strip()

    f.write(f"% Veir commit hash: {commit_hash}\n")

    f.write("% In the following commands the following rules apply:\n")
    f.write("% A: class  <1x\n")
    f.write("% B: class 1x\n")
    f.write("% C: class 1x-1.5x\n")
    f.write("% D: class 1.5x-2x\n")
    f.write("% E: class >2x\n")
    f.write("\n\n")

    # print the percentage of programs in each of the above classes, for each number of instructions
    for p, df in param_dfs.items():
        df["ratios_gisel_sdag"] = df["LLVM_globalisel"] / df["LLVM_selectiondag"]
        df["ratios_gisel_sdag_class"] = df["ratios_gisel_sdag"].apply(classify)
        max_ratio_gisel_sdag = df["ratios_gisel_sdag"].max()
        min_ratio_gisel_sdag = df["ratios_gisel_sdag"].min()

        p_label = "NumCycles" if p == "tot_cycles" else "NumInstr"

        f.write(
            f"\\newcommand{{\\MaxRatioGiselVsSdagParam{p_label}}}{{{max_ratio_gisel_sdag:.2f}}}\n"
        )
        f.write(
            f"\\newcommand{{\\MinRatioGiselVsSdagParam{p_label}}}{{{min_ratio_gisel_sdag:.2f}}}\n"
        )

        df_grouped_gisel_sdag = (
            df.groupby("init_instr")["ratios_gisel_sdag_class"]
            .value_counts(normalize=True)
            .reset_index()
        )
        df_grouped_gisel_sdag["proportion"] *= 100
        for _, row in df_grouped_gisel_sdag.iterrows():
            c = row["ratios_gisel_sdag_class"]
            instructions_number = num2words(row["init_instr"])
            f.write(
                f"\\newcommand{{\\PercGiselVsSdagParam{p_label}Class{c}Instr{instructions_number}}}{{{int(row['proportion'])}\%}}\n"
            )

        for vp in VEIR_PIPELINES:
            vp_label = "Xdsl" if vp == "VEIR_xdsl" else "Llvm"
            for lp, lp_label in [
                ("LLVM_globalisel", "Gisel"),
                ("LLVM_selectiondag", "Sdag"),
            ]:
                ratio_col = f"ratios_{vp_label}_{lp_label}"
                df[ratio_col] = df[vp] / df[lp]
                df[ratio_col + "_class"] = df[ratio_col].apply(classify)

                f.write(
                    f"\\newcommand{{\\MaxRatioVEIR{vp_label}Vs{lp_label}Param{p_label}}}{{{df[ratio_col].max():.2f}}}\n"
                )
                f.write(
                    f"\\newcommand{{\\MinRatioVEIR{vp_label}Vs{lp_label}Param{p_label}}}{{{df[ratio_col].min():.2f}}}\n"
                )

                grouped = (
                    df.groupby("init_instr")[ratio_col + "_class"]
                    .value_counts(normalize=True)
                    .reset_index()
                )
                grouped["proportion"] *= 100
                for _, row in grouped.iterrows():
                    c = row[ratio_col + "_class"]
                    instr_w = num2words(row["init_instr"])
                    f.write(
                        f"\\newcommand{{\\PercVEIR{vp_label}Vs{lp_label}Param{p_label}Class{c}Instr{instr_w}}}{{{int(row['proportion'])}\%}}\n"
                    )

                geomeans = df.groupby("init_instr")[ratio_col].apply(
                    lambda x: np.exp(np.log(x).mean())
                )
                for instr_num, gm in geomeans.items():
                    instr_w = num2words(instr_num)
                    f.write(
                        f"\\newcommand{{\\GeomeanVEIR{vp_label}Vs{lp_label}Param{p_label}Instr{instr_w}}}{{{gm:.1f}}}\n"
                    )

                gm_tot = np.exp(np.log(df[ratio_col]).mean())
                gm_tot_perc = (gm_tot - 1) * 100
                f.write(
                    f"\\newcommand{{\\GeomeanTotVEIR{vp_label}Vs{lp_label}{p_label}}}{{{gm_tot:.1f}}}\n"
                )
                f.write(
                    f"\\newcommand{{\\GeomeanTotVEIR{vp_label}Vs{lp_label}SlowDownPerc{p_label}}}{{{gm_tot_perc:.1f}\%}}\n"
                )

    f.close()


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
