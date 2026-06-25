func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.lshr %arg0, %arg0 : i64
  %1 = llvm.udiv %arg1, %arg1 : i64
  %2 = llvm.and %0, %1 : i64
  return %2 : i64
}

