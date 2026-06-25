func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.or %0, %arg0 : i64
  %2 = llvm.lshr exact %0, %1 : i64
  %3 = llvm.lshr %2, %arg1 : i64
  return %3 : i64
}

