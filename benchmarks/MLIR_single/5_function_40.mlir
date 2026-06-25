func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.xor %arg0, %arg0 : i64
  %1 = llvm.and %arg1, %arg1 : i64
  %2 = llvm.urem %0, %1 : i64
  %3 = llvm.ashr exact %arg2, %arg1 : i64
  %4 = llvm.ashr %2, %3 : i64
  return %4 : i64
}

