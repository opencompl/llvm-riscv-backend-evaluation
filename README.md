# Evaluating Veir's backend against LLVM 

### Dependencies 

The evaluation depends on: 
- LLVM with clang and MLIR
- XDSL 
- VEIR 

All these dependencies are correctly set up in `.gitmodules`. 

To fetch them and then build everything, run:
```
git submodule update --init --depth 1 -- llvm-project
git submodule update --init -- veir xdsl
./build.sh
```
You can use the same commands to bring in fresh versions of everything
and then rebuild.

To add llvm and mlir to your path: 
```
export PATH=$PATH:/LLVM_PATH/build/bin
```

The benchmatks' generation also requires running into the XDSL virtual environment: 
```
source ./build/xdsl-venv/bin/activate
```

The fuzzed benchmarks in `benchmarks/MLIR_multi` come from the [mlir-fuzz](https://github.com/opencompl/mlir-fuzz) fuzzer, at the version reported in `MLIR_multi/version_log.txt`. 


### Generating benchmarks

To generate the benchmarks compiled with llc (selectiondag), llc (globalisel), and veir run: 
```
python3 generate.py --num --jobs --llvm_opt
```

The script `generate.py` populates the folders in `benchmarks` by running the following: 
- For each file in `MLIR_multi`, extract `num` single MLIR modules and save them in `benchmarks/MLIR_single/`. Each file containing a single module will have two numbers that remain consistent throughout the lowering (e.g. `size_function_num`, where `size` is the initial program size specified in `generate_multi.py`). 
- using `mlir-opt`, convert each of these files containing a single module to the LLVM dialect, save the result in `benchmarks/LLVM/*.ll`

Then, the scripts lowers all the files using both LLVM and Veir, to enable the comparison of the lowered RISCV assembly output. 

*LLVM toolchain*
- using `mlir-translate`, convert the `*.ll` files in LLVMIR, and save the result in `benchmarks/LLVMIR/*.mlir`
- using `llc` with `selectionDAG`, compile the LLVMIR files to the `riscv` backend and save the result in `benchmarks/LLC_ASM_selectiondag/*.s`
- using `llc`, compile the LLVMIR files to the `riscv` backend and save the result in `benchmarks/LLC_ASM_globalisel/*.s`

*Veir toolchain*
- extract the first block `bb0` from the `*.ll` files and save the result in `benchmarks/MLIR_bb0_veir/*.mlir`
- run the Veir lowering to RiscV and save the result in `benchmarks/VEIR_ASM/*.mlir`, potentially in parallel by setting the `jobs` input argument (the default number is 1).
- remove `unrealized_cast` operations, perform register allocation, and lower to RISCV assembly using XDSL, save the result in `benchmarks/XDSL_ASM/*.mlir`

Each step in `generate.py` produces a log file, which one can retrieve in `logs/`. The names in the log file contain the function and the pass that outputted that file.
