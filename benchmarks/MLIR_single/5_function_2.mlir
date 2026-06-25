func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.xor %arg1, %arg2 : i64
  %1 = llvm.udiv %arg1, %0 : i64
  %2 = llvm.and %0, %1 : i64
  %3 = llvm.ashr exact %2, %arg1 : i64
  %4 = llvm.urem %arg0, %3 : i64
  return %4 : i64
}

