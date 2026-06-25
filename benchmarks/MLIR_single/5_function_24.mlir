func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.xor %arg2, %arg1 : i64
  %2 = llvm.and %1, %arg2 : i64
  %3 = llvm.lshr %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

