#!/usr/bin/env python3

import subprocess
import os
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


def parse_instructions(path):
    """Return the list of instruction tokens from the resource-pressure section of a .out file."""
    instructions = []
    in_section = False
    with open(path) as f:
        for line in f:
            if (
                "[0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    Instructions:"
                in line
            ):
                in_section = True
                continue
            if in_section and line.strip():
                instructions.append(line.split()[8:])
    return instructions or None


def build_comparison_dataframes(PIPELINES):
    """
    Read all .out files from each pipeline, match by function name, and return one DataFrame
    per metric: (df_instructions, df_cycles, df_uops).
    Only functions present in all three pipelines are included (inner join via dropna).
    """
    records = {}
    for pipeline, directory in PIPELINES.items():
        for filename in sorted(os.listdir(directory)):
            if not filename.endswith(".out"):
                continue
            name = filename[:-4]
            instr, cycles, uops = parse_mca_file(os.path.join(directory, filename))
            entry = records.setdefault(name, {})
            entry[f"{pipeline}_tot_instructions"] = instr
            entry[f"{pipeline}_tot_cycles"] = cycles
            entry[f"{pipeline}_tot_uops"] = uops

    df = pd.DataFrame.from_dict(records, orient="index")
    df.index.name = "function_name"
    df = df.reset_index().dropna()
    df["instructions_number"] = df["function_name"].apply(
        lambda x: int(x.split("_")[0])
    )

    def _cols(param):
        return ["function_name", "instructions_number"] + [
            f"{p}_{param}" for p in PIPELINES
        ]

    return df[_cols("tot_instructions")], df[_cols("tot_cycles")], df[_cols("tot_uops")]


def build_similarity_dataframe(PIPELINES, VEIR_PIPELINES, LLVM_PIPELINES):
    """
    Compare instruction lists emitted by each pipeline for the same function.
    Writes similarity.csv to data_dir with boolean equivalence columns.
    """
    records = {}
    for pipeline, directory in PIPELINES.items():
        for filename in sorted(os.listdir(directory)):
            if not filename.endswith(".out"):
                continue
            name = filename[:-4]
            instrs = parse_instructions(os.path.join(directory, filename))
            if instrs is not None:
                records.setdefault(name, {})[pipeline] = instrs

    rows = []
    for name, pipelines in records.items():
        if not all(p in pipelines for p in PIPELINES):
            continue
        row = {
            "function_name": name,
            "instructions_number": int(name.split("_")[0]),
        }
        for vp in VEIR_PIPELINES:
            for lp in LLVM_PIPELINES:
                row[f"is_eqv_{vp}_vs_{lp}"] = pipelines[vp] == pipelines[lp]
        rows.append(row)

    df = pd.DataFrame(rows)
    # df.to_csv(data_dir + "similarity.csv", index=False)
    return df


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


def bar_plot(parameter, selector1, selector2, data_dir, plots_dir):
    df = pd.read_csv(data_dir + parameter + ".csv")

    col1 = selector1 + "_" + parameter
    col2 = selector2 + "_" + parameter

    if col1 not in df.columns:
        print(f"Error: the column {col1} does not exist in the dataframe.")
        return
    if col2 not in df.columns:
        print(f"Error: the column {col2} does not exist in the dataframe.")
        return

    # Compute the difference
    df["diff"] = df[col1] / df[col2]

    df["diff_class"] = df["diff"].apply(classify)

    # df.to_csv(data_dir + parameter + f"_{selector1}_vs_{selector2}_classified.csv")

    # For each unique value of the initial `instructions_number`, compute the % of each diff_class
    group = (
        df.groupby("instructions_number")["diff_class"]
        .value_counts(normalize=True)
        .unstack(fill_value=0)
        * 100
    )

    # Ensure all classes are present for consistent coloring/order
    class_order = ["<1x", "1x", "1x-1.5x", "1.5x-2x", ">2x"]

    group = group.reindex(columns=class_order, fill_value=0)

    # Colors for each class
    class_colors = {
        "<1x": light_blue,
        "1x": dark_green,
        "1x-1.5x": light_green,
        "1.5x-2x": light_red,
        ">2x": dark_red,
    }

    similarity_df = pd.read_csv(data_dir + "similarity.csv")
    similarity_percentages = {}
    col_name = f"is_eqv_{selector1}_vs_{selector2}"
    for instr_num, group_df in similarity_df.groupby("instructions_number"):
        total_count = len(group_df)
        true_count = group_df[col_name].sum()
        percentage = (true_count / total_count) * 100 if total_count > 0 else 0.0
        similarity_percentages[int(instr_num)] = percentage

    def plot_columns(with_similarity=False):
        bottom = np.zeros(len(group))
        x = group.index.astype(str)
        plt.figure(figsize=(10, 5))
        for c in class_order:
            if c == "1x" and with_similarity:
                similarity_list = list(similarity_percentages.values())
                remaining = [a - b for a, b in zip(group[c], similarity_list)]
                plt.bar(
                    x, similarity_list, bottom=bottom, color=class_colors[c], hatch="//"
                )
                bottom += similarity_list
                plt.bar(
                    x, remaining, bottom=bottom, label=f"{c}", color=class_colors[c]
                )
                bottom += remaining
            else:
                plt.bar(x, group[c], bottom=bottom, label=f"{c}", color=class_colors[c])
                bottom += group[c].values

        plt.xlabel("#instructions - LLVM IR")
        plt.ylabel(
            "%Programs", rotation="horizontal", horizontalalignment="left", y=1.05
        )
        plt.legend(ncols=5, bbox_to_anchor=(0.5, -0.5), loc="lower center")
        plt.subplots_adjust(bottom=0.4)
        plt.tight_layout()

        name_extension = "_similarity_" if with_similarity else "_"
        pdf_filename = (
            plots_dir
            + f"{parameter}_stacked_bar{name_extension}{selector1}_vs_{selector2}.pdf"
        )
        plt.savefig(pdf_filename)
        # print(
        #     f"\nStacked bar plot saved to '{pdf_filename}' in the current working directory."
        # )
        plt.close()

    plot_columns()
    if parameter == "tot_instructions":
        plot_columns(with_similarity=True)


def violin_plot(parameter, selector1, selector2, data_dir, plots_dir):
    df = pd.read_csv(data_dir + parameter + ".csv")

    col1 = selector1 + "_" + parameter
    col2 = selector2 + "_" + parameter

    if col1 not in df.columns:
        print(f"Error: the column {col1} does not exist in the dataframe.")
        return
    if col2 not in df.columns:
        print(f"Error: the column {col2} does not exist in the dataframe.")
        return

    df["ratio"] = df[col1] / df[col2]

    num_above_50 = sum(df["ratio"] > 50)

    print(f"Number of programs with ratio above 50: {num_above_50} out of {len(df)}")

    # extract the columns with ratio > 50

    high_ratio_df = (df[df["ratio"] > 50]).groupby("instructions_number")
    for instr_num, group in high_ratio_df:
        print(
            f"LLVM #Instructions: {instr_num}, #programs with ratio > 50 : {len(group)}"
        )

    # remove points above 50 for y-axis scaling

    grouped = df.groupby("instructions_number")["ratio"].apply(list).reset_index()

    violin_data = grouped["ratio"].values
    positions = grouped["instructions_number"].values

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

    # add a marker at the top of every column indicating the number of outliers removed

    max_ratio = df["ratio"].max()

    print(
        f"Max ratio for {parameter} between {selector1} and {selector2} is {max_ratio}"
    )

    if max_ratio > 200:
        plt.yticks(np.arange(0, 270, 50))
    else:
        plt.yticks(np.arange(0, math.ceil(df["ratio"].max()) + 2, 2))

    plt.tight_layout()

    pdf_filename = plots_dir + f"{parameter}_violin_{selector1}_vs_{selector2}.pdf"
    plt.savefig(pdf_filename)
    # print(f"\nViolin plot saved to '{pdf_filename}' in the current working directory.")
    plt.close()


def geomean_plot_tot_cycles(data_dir, plots_dir):
    param_keys = [("tot_instructions", "#instructions"), ("tot_cycles", "#cycles")]
    veir_llvm_pairs = [
        ("VEIR_xdsl", "LLVM_globalisel"),
        ("VEIR_xdsl", "LLVM_selectiondag"),
        ("VEIR_llvm", "LLVM_globalisel"),
        ("VEIR_llvm", "LLVM_selectiondag"),
    ]
    pair_colors = [light_blue, light_red, dark_blue, dark_red]
    pair_labels = [
        f"{selector_labels[vp]} / {selector_labels[lp]}" for vp, lp in veir_llvm_pairs
    ]

    x = np.arange(len(param_keys))
    n = len(veir_llvm_pairs)
    width = 0.18
    offsets = np.linspace(-(n - 1) / 2, (n - 1) / 2, n) * width

    plt.figure(figsize=(8, 5))
    for i, ((vp, lp), color, label, offset) in enumerate(
        zip(veir_llvm_pairs, pair_colors, pair_labels, offsets)
    ):
        geomeans = []
        for csv_key, _ in param_keys:
            df = pd.read_csv(data_dir + csv_key + ".csv")
            ratio = df[f"{vp}_{csv_key}"] / df[f"{lp}_{csv_key}"]
            geomeans.append(np.exp(np.mean(np.log(ratio))))
        plt.bar(x + offset, geomeans, width, label=label, color=color)

    plt.axhline(1, color=black, linestyle="--", linewidth=2)
    plt.ylabel(
        "Geomean Ratio",
        rotation="horizontal",
        horizontalalignment="left",
        y=1,
    )
    plt.xticks(x, [label for _, label in param_keys])
    plt.legend(fontsize=12)
    plt.tight_layout()

    pdf_filename = plots_dir + "geomean_comparison.pdf"
    plt.savefig(pdf_filename)
    print(f"\nGeometric mean plot saved to '{pdf_filename}'.")
    plt.close()


def equivalent_plot_perc(data_dir, plots_dir):
    df_similarity = pd.read_csv(data_dir + "similarity.csv")

    pairs = [
        ("VEIR_xdsl", "LLVM_globalisel", light_blue),
        ("VEIR_xdsl", "LLVM_selectiondag", light_red),
        ("VEIR_llvm", "LLVM_globalisel", dark_blue),
        ("VEIR_llvm", "LLVM_selectiondag", dark_red),
    ]

    plt.figure(figsize=(8, 5))
    n = len(pairs)
    width = 0.18
    offsets = np.linspace(-(n - 1) / 2, (n - 1) / 2, n) * width

    instr_nums = sorted(df_similarity["instructions_number"].unique())
    x = np.array(instr_nums)

    for (vp, lp, color), offset in zip(pairs, offsets):
        col = f"is_eqv_{vp}_vs_{lp}"
        pct = (
            (df_similarity.groupby("instructions_number")[col].mean() * 100)
            .reindex(instr_nums, fill_value=0)
            .values
        )
        plt.bar(
            x + offset,
            pct,
            width,
            label=f"{selector_labels[vp]} / {selector_labels[lp]}",
            color=color,
        )

    plt.ylabel(
        "% Identical Outputs",
        rotation="horizontal",
        horizontalalignment="left",
        y=1.05,
    )
    plt.xlabel("#Instructions - LLVM IR")

    plt.legend()
    plt.tight_layout()

    pdf_filename = plots_dir + "equivalent_outputs.pdf"
    plt.savefig(pdf_filename)
    print(
        f"\nGeometric mean plot saved to '{pdf_filename}' in the current working directory."
    )
    plt.close()


def classify(x):
    if x < 1:
        return "A"
    if x == 1:
        return "B"
    if x < 1.5:
        return "C"
    if x < 2:
        return "D"
    return "E"


def proportional_bar_plot(parameter, selector1, selector2, data_dir, plots_dir):
    df = pd.read_csv(data_dir + parameter + ".csv")

    plt.figure(figsize=(7, 5))

    col1 = selector1 + "_" + parameter
    col2 = selector2 + "_" + parameter

    if col1 not in df.columns or col2 not in df.columns:
        print(
            f"Error: One or both columns ({col1}, {col2}) do not exist in the dataframe."
        )
        return

    df["ratios"] = df[col1] / df[col2]

    average_ratios_by_instruction = (
        df.groupby("instructions_number")["ratios"]
        .apply(lambda x: np.exp(np.log(x).mean()))
        .reset_index(name="average_ratio")
    )

    print(selector2)
    print(parameter)
    print(max(df["ratios"]))

    width = 0.8

    plt.bar(
        average_ratios_by_instruction["instructions_number"],
        average_ratios_by_instruction["average_ratio"],
        color=light_green,
        width=width,
        label=f"Avg. {parameters_labels[parameter]},$\\frac{{\\text{{{selector_labels[selector1]}}}}}{{\\text{{{selector_labels[selector2]}}}}}$",
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

    if (selector2 == "LLVM_globalisel") and (parameter == "tot_instructions"):
        plt.yticks(np.arange(0, 2, 0.5))
        plt.text(
            (((average_ratios_by_instruction["instructions_number"]).to_list())[-1])
            * 1.15,
            0.95,
            "GISel",
            color=black,
            ha="center",
            fontsize=20,
        )
    elif (selector2 == "LLVM_selectiondag") and (parameter == "tot_instructions"):
        plt.yticks(np.arange(0, 3, 1))
        plt.text(
            (((average_ratios_by_instruction["instructions_number"]).to_list())[-1])
            * 1.15,
            0.95,
            "SDAG",
            color=black,
            ha="center",
            fontsize=20,
        )

    plt.xticks(np.arange(3, 9, 1))

    plt.tight_layout()

    # uncomment to have numbers on top of the bars
    # for bar in bars:
    #     height = bar.get_height()
    #     plt.text(bar.get_x() + bar.get_width()/2., height,
    #             f'{height:.2f}',
    #             ha='center', va='bottom')

    pdf_filename = (
        plots_dir + f"{parameter}_proportional_bar_{selector1}_vs_{selector2}.pdf"
    )
    plt.savefig(pdf_filename)
    print(
        f"\nProportional bar plot saved to '{pdf_filename}' in the current working directory."
    )
    plt.close()


def convert_pdf_to_jpg(pdf_path):
    from pdf2image import convert_from_path

    images = convert_from_path(pdf_path, dpi=150)
    jpg_path = pdf_path.replace(".pdf", ".jpg")
    images[0].save(jpg_path, "JPEG")
    return jpg_path


def create_latex_command(parameters, filename, data_dir, ROOT_DIR_PATH, VEIR_PIPELINES):
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
    for p in parameters:
        df = pd.read_csv(data_dir + p + ".csv")

        df["ratios_gisel_sdag"] = (
            df["LLVM_globalisel_" + p] / df["LLVM_selectiondag_" + p]
        )
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
            df.groupby("instructions_number")["ratios_gisel_sdag_class"]
            .value_counts(normalize=True)
            .reset_index()
            * 100
        )
        for _, row in df_grouped_gisel_sdag.reset_index().iterrows():
            c = row["ratios_gisel_sdag_class"]
            instructions_number = num2words(row["instructions_number"])
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
                df[ratio_col] = df[f"{vp}_{p}"] / df[f"{lp}_{p}"]
                df[ratio_col + "_class"] = df[ratio_col].apply(classify)

                f.write(
                    f"\\newcommand{{\\MaxRatioVEIR{vp_label}Vs{lp_label}Param{p_label}}}{{{df[ratio_col].max():.2f}}}\n"
                )
                f.write(
                    f"\\newcommand{{\\MinRatioVEIR{vp_label}Vs{lp_label}Param{p_label}}}{{{df[ratio_col].min():.2f}}}\n"
                )

                grouped = (
                    df.groupby("instructions_number")[ratio_col + "_class"]
                    .value_counts(normalize=True)
                    .reset_index()
                )
                grouped["proportion"] *= 100
                for _, row in grouped.iterrows():
                    c = row[ratio_col + "_class"]
                    instr_w = num2words(row["instructions_number"])
                    f.write(
                        f"\\newcommand{{\\PercVEIR{vp_label}Vs{lp_label}Param{p_label}Class{c}Instr{instr_w}}}{{{int(row['proportion'])}\%}}\n"
                    )

                geomeans = df.groupby("instructions_number")[ratio_col].apply(
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

    # print the percentage of programs that are identical, for each number of instructions
    df_similarity = pd.read_csv(data_dir + "similarity.csv")

    for vp in VEIR_PIPELINES:
        vp_label = "Xdsl" if vp == "VEIR_xdsl" else "Llvm"
        for lp, lp_label in [
            ("LLVM_globalisel", "Gisel"),
            ("LLVM_selectiondag", "Sdag"),
        ]:
            col = f"is_eqv_{vp}_vs_{lp}"
            grouped = (
                df_similarity.groupby("instructions_number")[col]
                .value_counts(normalize=True)
                .reset_index()
            )
            grouped["proportion"] *= 100
            for _, row in grouped.iterrows():
                if row[col]:
                    instr_w = num2words(row["instructions_number"])
                    f.write(
                        f"\\newcommand{{\\PercIdentical{vp_label}{lp_label}Instr{instr_w}}}{{{int(row['proportion'])}\%}}\n"
                    )
            tot = df_similarity[col].mean() * 100
            f.write(
                f"\\newcommand{{\\PercIdentical{vp_label}{lp_label}Tot}}{{{tot:.1f}\%}}\n"
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

    dry_run = True
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
