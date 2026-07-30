#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LLVM_SRC="$SCRIPT_DIR/llvm-project"
VEIR_SRC="$SCRIPT_DIR/veir"
GEM5_SRC="$SCRIPT_DIR/gem5"
LLVM_BUILD="$LLVM_SRC/build"
LLVM_INSTALL="$LLVM_BUILD"

info() { echo "[build] $*"; }

info "Configuring LLVM..."
cmake -G Ninja \
    -S "$LLVM_SRC/llvm" \
    -B "$LLVM_BUILD" \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_PROJECTS="mlir;clang" \
    -DLLVM_TARGETS_TO_BUILD="host;RISCV" \
    -DLLVM_ENABLE_ASSERTIONS=ON

info "Building LLVM..."
ninja -C "$LLVM_BUILD"

export PATH="$LLVM_INSTALL/bin:$PATH"

info "Building VeIR..."
(cd "$VEIR_SRC" && lake build)

info "Building gem5..."
(cd "$GEM5_SRC" && scons build/RISCV/gem5.opt -j"$(nproc)")

uv build utils

