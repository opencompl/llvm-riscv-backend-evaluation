# Benchmark generation, MCA analysis, and plotting

# Requires mlir-opt, mlir-translate, llc, opt, llvm-mca, veir, xdsl


.PHONY: all pipeline quick clean

all: pipeline

pipeline: 
	uv run synthetic-benchmarks/generate.py -j 4
	uv run synthetic-benchmarks/mca.py
	uv run synthetic-benchmarks/plot.py
	
	uv run real-benchmarks/generate.py
	uv run real-benchmarks/mca.py
	uv run real-benchmarks/table.py
	
# Quick single-thread run pipeline for testing purposes
quick: 
	uv run synthetic-benchmarks/generate.py -j 1 -n 5
	uv run synthetic-benchmarks/mca.py
	uv run synthetic-benchmarks/plot.py
	
	uv run real-benchmarks/generate.py -j 1
	uv run real-benchmarks/mca.py
	uv run real-benchmarks/table.py


clean:
	rm -rf synthetic-benchmarks/LLVM synthetic-benchmarks/LLVMIR synthetic-benchmarks/LLVM_preopt \
	       synthetic-benchmarks/MLIR_single synthetic-benchmarks/MLIR_bb0_veir synthetic-benchmarks/MLIR_preopt \
	       synthetic-benchmarks/LLC_ASM_selectiondag synthetic-benchmarks/LLC_ASM_globalisel \
	       synthetic-benchmarks/VEIR_ASM synthetic-benchmarks/VEIR_MIR synthetic-benchmarks/VEIR_REGALLOC_ASM \
	       synthetic-benchmarks/XDSL_FUNC synthetic-benchmarks/XDSL_ASM synthetic-benchmarks/logs
	rm -rf real-benchmarks/LLVMIR real-benchmarks/LLVM_preopt real-benchmarks/MLIR_init \
	       real-benchmarks/MLIR_bb0_veir real-benchmarks/MLIR_preopt \
	       real-benchmarks/LLC_ASM_selectiondag real-benchmarks/LLC_ASM_globalisel \
	       real-benchmarks/VEIR_ASM real-benchmarks/VEIR_MIR real-benchmarks/VEIR_REGALLOC_ASM \
	       real-benchmarks/logs real-benchmarks/results real-benchmarks/data
	rm -rf synthetic-benchmarks/results synthetic-benchmarks/plots synthetic-benchmarks/data synthetic-benchmarks/tables
