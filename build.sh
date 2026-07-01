#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LLVM_SRC="$SCRIPT_DIR/llvm-project"
VEIR_SRC="$SCRIPT_DIR/veir"
XDSL_SRC="$SCRIPT_DIR/xdsl"
BUILD_DIR="$SCRIPT_DIR/build"
LLVM_BUILD="$BUILD_DIR/llvm"
LLVM_INSTALL="$LLVM_BUILD"
XDSL_VENV="$BUILD_DIR/xdsl-venv"

info() { echo "[build] $*"; }

info "Configuring LLVM..."
cmake -G Ninja \
    -S "$LLVM_SRC/llvm" \
    -B "$LLVM_BUILD" \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_ENABLE_PROJECTS="mlir;clang" \
    -DLLVM_ENABLE_ASSERTIONS=ON

info "Building LLVM..."
ninja -C "$LLVM_BUILD"

info "Setting up xDSL virtualenv..."
uv venv "$XDSL_VENV" --python python3
uv pip install --python "$XDSL_VENV" -e "$XDSL_SRC"


export PATH="$LLVM_INSTALL/bin:$PATH"

info "Building VeIR..."
(cd "$VEIR_SRC" && lake build)

uv build utils