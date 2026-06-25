func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.ashr exact %0, %arg1 : i64
  %2 = llvm.or %0, %1 : i64
  %3 = llvm.lshr %0, %2 : i64
  return %3 : i64
}

