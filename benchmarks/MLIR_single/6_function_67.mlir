func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.xor %arg1, %arg1 : i64
  %1 = llvm.lshr exact %arg1, %0 : i64
  %2 = llvm.and %arg0, %1 : i64
  %3 = llvm.xor %arg2, %2 : i64
  %4 = llvm.srem %arg1, %3 : i64
  %5 = llvm.ashr %arg0, %4 : i64
  return %5 : i64
}

