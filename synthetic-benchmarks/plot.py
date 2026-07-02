#!/usr/bin/env python3

import subprocess
import matplotlib
from pathlib import Path

import pandas as pd
from utils.plot import (
    collect_data,
    stacked_bar_plot_perc,
    violin_plot,
    proportional_bar_plot,
    create_latex_command,
    convert_pdf_to_jpg,
    setup_plotting_directories,
    upload_to_zulip,
    compare_mca_diff_all,
    compare_mca_diff_by_size,
    compare_mca_diff_performance
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

ROOT_DIR_PATH = Path(
    subprocess.check_output(["git", "rev-parse", "--show-toplevel"]).decode().strip()
)

LLVMIR_DIR_PATH = f"{ROOT_DIR_PATH}/synthetic-benchmarks/LLVMIR/"

RESULTS_DIR = ROOT_DIR_PATH / "synthetic-benchmarks" / "results"

PIPELINES = {
    "LLVM_globalisel": RESULTS_DIR / "LLVM_globalisel",
    "LLVM_selectiondag": RESULTS_DIR / "LLVM_selectiondag",
    "VEIR_xdsl": RESULTS_DIR / "VEIR_xdsl",
    "VEIR_llvm": RESULTS_DIR / "VEIR_llvm",
}

VEIR_PIPELINES = ["VEIR_xdsl", "VEIR_llvm"]
LLVM_PIPELINES = ["LLVM_globalisel", "LLVM_selectiondag"]

tables_dir = f"{ROOT_DIR_PATH}/synthetic-benchmarks/tables/"
data_dir = f"{ROOT_DIR_PATH}/synthetic-benchmarks/data/"
plots_dir = f"{ROOT_DIR_PATH}/synthetic-benchmarks/plots/"


def main():

    setup_plotting_directories(data_dir, plots_dir)

    df_instructions, df_cycles, df_uops = collect_data(PIPELINES)
    
    df_instructions.to_csv(data_dir + "raw_instructions.csv", index=False)
    df_cycles.to_csv(data_dir + "raw_cycles.csv", index=False)
    df_uops.to_csv(data_dir + "raw_uops.csv", index=False)
    
    df_instructions["init_instr"] = df_instructions["benchmark"].apply(
        lambda x: int(x.split("_")[0]) if "_" in x else None
    )
    df_cycles["init_instr"] = df_cycles["benchmark"].apply(
        lambda x: int(x.split("_")[0]) if "_" in x else None
    )
    df_uops["init_instr"] = df_uops["benchmark"].apply(
        lambda x: int(x.split("_")[0]) if "_" in x else None
    )
    
    # # Stacked bar plots 
    # stacked_bar_plot_perc(df_instructions,"tot_instructions", "VEIR_llvm", "LLVM_globalisel", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_instructions,"tot_instructions", "VEIR_xdsl", "LLVM_globalisel", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_instructions,"tot_instructions", "VEIR_llvm", "LLVM_selectiondag", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_instructions,"tot_instructions", "VEIR_xdsl", "LLVM_selectiondag", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_cycles,"tot_cycles", "VEIR_llvm", "LLVM_globalisel", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_cycles,"tot_cycles", "VEIR_xdsl", "LLVM_globalisel", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_cycles,"tot_cycles", "VEIR_llvm", "LLVM_selectiondag", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_cycles,"tot_cycles", "VEIR_xdsl", "LLVM_selectiondag", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_uops, "tot_uops", "VEIR_llvm", "LLVM_globalisel", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_uops, "tot_uops", "VEIR_xdsl", "LLVM_globalisel", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_uops, "tot_uops", "VEIR_llvm", "LLVM_selectiondag", data_dir, plots_dir)
    # stacked_bar_plot_perc(df_uops, "tot_uops", "VEIR_xdsl", "LLVM_selectiondag", data_dir, plots_dir)
    
    
    # # Violin plots 
    
    # violin_plot(df_instructions,"tot_instructions", "VEIR_llvm", "LLVM_globalisel", data_dir, plots_dir)
    # violin_plot(df_instructions,"tot_instructions", "VEIR_xdsl", "LLVM_globalisel", data_dir, plots_dir)
    # violin_plot(df_instructions,"tot_instructions", "VEIR_llvm", "LLVM_selectiondag", data_dir, plots_dir)
    # violin_plot(df_instructions,"tot_instructions", "VEIR_xdsl", "LLVM_selectiondag", data_dir, plots_dir)
    # violin_plot(df_cycles,"tot_cycles", "VEIR_llvm", "LLVM_globalisel", data_dir, plots_dir)
    # violin_plot(df_cycles,"tot_cycles", "VEIR_xdsl", "LLVM_globalisel", data_dir, plots_dir)
    # violin_plot(df_cycles,"tot_cycles", "VEIR_llvm", "LLVM_selectiondag", data_dir, plots_dir)
    # violin_plot(df_cycles,"tot_cycles", "VEIR_xdsl", "LLVM_selectiondag", data_dir, plots_dir)
    # violin_plot(df_uops,"tot_uops", "VEIR_llvm", "LLVM_globalisel", data_dir, plots_dir)
    # violin_plot(df_uops,"tot_uops", "VEIR_xdsl", "LLVM_globalisel", data_dir, plots_dir)
    # violin_plot(df_uops,"tot_uops", "VEIR_llvm", "LLVM_selectiondag", data_dir, plots_dir)
    # violin_plot(df_uops,"tot_uops", "VEIR_xdsl", "LLVM_selectiondag", data_dir, plots_dir)


    # # Proportional bar plots
    # proportional_bar_plot(df_instructions,"tot_instructions", "VEIR_llvm", "LLVM_globalisel", data_dir, plots_dir)
    # proportional_bar_plot(df_instructions,"tot_instructions", "VEIR_xdsl", "LLVM_globalisel", data_dir, plots_dir)
    # proportional_bar_plot(df_instructions,"tot_instructions", "VEIR_llvm", "LLVM_selectiondag", data_dir, plots_dir)
    # proportional_bar_plot(df_instructions,"tot_instructions", "VEIR_xdsl", "LLVM_selectiondag", data_dir, plots_dir)
    # proportional_bar_plot(df_cycles,"tot_cycles", "VEIR_llvm", "LLVM_globalisel", data_dir, plots_dir)
    # proportional_bar_plot(df_cycles,"tot_cycles", "VEIR_xdsl", "LLVM_globalisel", data_dir, plots_dir)
    # proportional_bar_plot(df_cycles,"tot_cycles", "VEIR_llvm", "LLVM_selectiondag", data_dir, plots_dir)
    # proportional_bar_plot(df_cycles,"tot_cycles", "VEIR_xdsl", "LLVM_selectiondag", data_dir, plots_dir)
    # proportional_bar_plot(df_uops,"tot_uops", "VEIR_llvm", "LLVM_globalisel", data_dir, plots_dir)
    # proportional_bar_plot(df_uops,"tot_uops", "VEIR_xdsl", "LLVM_globalisel", data_dir, plots_dir)
    # proportional_bar_plot(df_uops,"tot_uops", "VEIR_llvm", "LLVM_selectiondag", data_dir, plots_dir)
    # proportional_bar_plot(df_uops,"tot_uops", "VEIR_xdsl", "LLVM_selectiondag", data_dir, plots_dir)


    # create_latex_command(
    #     {"tot_cycles": df_cycles, "tot_instructions": df_instructions},
    #     plots_dir + "numerical_commands.tex",
    #     ROOT_DIR_PATH,
    #     VEIR_PIPELINES,
    # )

    # jpg_plot1 = convert_pdf_to_jpg(
    #     plots_dir + "proportional_tot_cycles_VEIR_llvm_vs_LLVM_selectiondag.pdf"
    # )
    # jpg_plot2 = convert_pdf_to_jpg(
    #     plots_dir + "proportional_tot_instructions_VEIR_llvm_vs_LLVM_selectiondag.pdf"
    # )
    
    # compare_mca_diff_all(RESULTS_DIR / "VEIR_llvm" , RESULTS_DIR / "LLVM_selectiondag")
    # compare_mca_diff_all(RESULTS_DIR / "VEIR_llvm" , RESULTS_DIR / "LLVM_globalisel")
    # compare_mca_diff_all(RESULTS_DIR / "VEIR_xdsl" , RESULTS_DIR / "LLVM_selectiondag")
    # compare_mca_diff_all(RESULTS_DIR / "VEIR_xdsl" , RESULTS_DIR / "LLVM_globalisel")
    
    # sizes = [3,4,5,6,7,8]
    # compare_mca_diff_by_size(RESULTS_DIR / "VEIR_llvm" , RESULTS_DIR / "LLVM_selectiondag", sizes)
    # compare_mca_diff_by_size(RESULTS_DIR / "VEIR_llvm" , RESULTS_DIR / "LLVM_globalisel", sizes)
    # compare_mca_diff_by_size(RESULTS_DIR / "VEIR_xdsl" , RESULTS_DIR / "LLVM_selectiondag", sizes)
    # compare_mca_diff_by_size(RESULTS_DIR / "VEIR_xdsl" , RESULTS_DIR / "LLVM_globalisel", sizes)
    
    compare_mca_diff_performance(df_instructions, "tot_instructions", "VEIR_llvm", "LLVM_selectiondag")
    compare_mca_diff_performance(df_instructions, "tot_instructions", "VEIR_xdsl", "LLVM_selectiondag")
    compare_mca_diff_performance(df_instructions, "tot_instructions", "VEIR_llvm", "LLVM_globalisel")
    compare_mca_diff_performance(df_instructions, "tot_instructions", "VEIR_xdsl", "LLVM_globalisel")
    compare_mca_diff_performance(df_cycles, "tot_cycles", "VEIR_llvm", "LLVM_selectiondag")
    compare_mca_diff_performance(df_cycles, "tot_cycles", "VEIR_xdsl", "LLVM_selectiondag")
    compare_mca_diff_performance(df_cycles, "tot_cycles", "VEIR_llvm", "LLVM_globalisel")
    compare_mca_diff_performance(df_cycles, "tot_cycles", "VEIR_xdsl", "LLVM_globalisel")

    # upload_to_zulip(
    #     root_dir(),
    #     machine_username(),
    #     machine_hostname(),
    #     machine_uname(),
    #     git_hash(),
    #     [
    #         "Synthetic benchmarks - #Cycles, Veir-LLVM vs. selectionDAG ",
    #         "Synthetic benchmarks - #Instructions, Veir-LLVM vs. selectionDAG ",
    #     ],
    #     [jpg_plot1, jpg_plot2],
    # )


if __name__ == "__main__":
    main()
