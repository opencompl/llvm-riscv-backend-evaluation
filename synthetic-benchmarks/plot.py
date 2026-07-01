#!/usr/bin/env python3

import subprocess
import argparse
import matplotlib
from utils.plot import (
    build_similarity_dataframe,
    build_comparison_dataframes,
    bar_plot,
    violin_plot,
    proportional_bar_plot,
    geomean_plot_tot_cycles,
    equivalent_plot_perc,
    create_latex_command,
    convert_pdf_to_jpg,
    setup_plotting_directories,
    upload_to_zulip,
)

from utils.lib import (
    root_dir,
    machine_username,
    machine_hostname,
    machine_uname,
    git_hash,
)

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

ROOT_DIR_PATH = (
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"])
    .decode("utf-8")
    .strip()
)

LLVMIR_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/LLVMIR/"

PIPELINES = {
    "LLVM_globalisel": f"{ROOT_DIR_PATH}/synthetic-benchmarks/results/LLVM_globalisel/",
    "LLVM_selectiondag": f"{ROOT_DIR_PATH}/synthetic-benchmarks/results/LLVM_selectiondag/",
    "VEIR_xdsl": f"{ROOT_DIR_PATH}/synthetic-benchmarks/results/VEIR_xdsl/",
    "VEIR_llvm": f"{ROOT_DIR_PATH}/synthetic-benchmarks/results/VEIR_llvm/",
}

VEIR_PIPELINES = ["VEIR_xdsl", "VEIR_llvm"]
LLVM_PIPELINES = ["LLVM_globalisel", "LLVM_selectiondag"]

tables_dir = f"{ROOT_DIR_PATH}/synthetic-benchmarks/tables/"
data_dir = f"{ROOT_DIR_PATH}/synthetic-benchmarks/data/"
plots_dir = f"{ROOT_DIR_PATH}/synthetic-benchmarks/plots/"


def main():
    parser = argparse.ArgumentParser(
        prog="plot",
        description="Produce the plots to evaluate the performance of the Veir certified Instruction Selection.",
    )

    parser.add_argument(
        "-p",
        "--parameters",
        nargs="+",
        choices=["tot_instructions", "tot_cycles", "tot_uops", "similarity", "all"],
        default="all",
    )

    parser.add_argument(
        "-t",
        "--plot_type",
        nargs="+",
        choices=["scatter", "sorted", "stacked", "overhead", "violin", "all"],
        default="all",
    )

    args = parser.parse_args()

    params_to_evaluate = (
        ["similarity", "tot_instructions", "tot_cycles", "tot_uops"]
        if "all" in args.parameters
        else args.parameters
    )

    plots_to_produce = (
        ["scatter", "sorted", "stacked", "overhead", "proportional", "violin"]
        if "all" in args.plot_type
        else args.plot_type
    )

    setup_plotting_directories(data_dir, plots_dir)

    df_instructions, df_cycles, df_uops = build_comparison_dataframes(PIPELINES)
    df_instructions.to_csv(data_dir + "tot_instructions.csv", index=False)
    df_cycles.to_csv(data_dir + "tot_cycles.csv", index=False)
    df_uops.to_csv(data_dir + "tot_uops.csv", index=False)

    numeric_params = [p for p in params_to_evaluate if p != "similarity"]
    for parameter in numeric_params:
        for vp in VEIR_PIPELINES:
            if "stacked" in plots_to_produce or "all" in plots_to_produce:
                bar_plot(parameter, vp, "LLVM_globalisel", data_dir, plots_dir)
                bar_plot(parameter, vp, "LLVM_selectiondag", data_dir, plots_dir)
            if "violin" in plots_to_produce or "all" in plots_to_produce:
                violin_plot(parameter, vp, "LLVM_globalisel", data_dir, plots_dir)
                violin_plot(parameter, vp, "LLVM_selectiondag", data_dir, plots_dir)
            if "proportional" in plots_to_produce or "all" in plots_to_produce:
                proportional_bar_plot(
                    parameter, vp, "LLVM_globalisel", data_dir, plots_dir
                )
                proportional_bar_plot(
                    parameter, vp, "LLVM_selectiondag", data_dir, plots_dir
                )
        if "violin" in plots_to_produce or "all" in plots_to_produce:
            violin_plot(
                parameter, "LLVM_globalisel", "LLVM_selectiondag", data_dir, plots_dir
            )

    geomean_plot_tot_cycles(data_dir, plots_dir)
    equivalent_plot_perc(data_dir, plots_dir)
    create_latex_command(
        ["tot_cycles", "tot_instructions"],
        plots_dir + "numerical_commands.tex",
        data_dir,
        ROOT_DIR_PATH,
        VEIR_PIPELINES,
    )

    jpg_plot1 = convert_pdf_to_jpg(
        plots_dir + "tot_cycles_proportional_bar_VEIR_llvm_vs_LLVM_globalisel.pdf"
    )
    jpg_plot2 = convert_pdf_to_jpg(
        plots_dir + "tot_instructions_proportional_bar_VEIR_llvm_vs_LLVM_globalisel.pdf"
    )

    upload_to_zulip(
        root_dir(),
        machine_username(),
        machine_hostname(),
        machine_uname(),
        git_hash(),
        [
            "Synthetic benchmarks - #Cycles, Veir-LLVM vs. selectionDAG ",
            "Synthetic benchmarks - #Instructions, Veir-LLVM vs. selectionDAG ",
        ],
        [jpg_plot1, jpg_plot2],
    )


if __name__ == "__main__":
    main()
