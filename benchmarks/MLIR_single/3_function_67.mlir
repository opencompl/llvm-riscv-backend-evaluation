func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.ashr %arg0, %arg0 : i64
  %1 = llvm.or disjoint %arg1, %0 : i64
  %2 = llvm.udiv %0, %1 : i64
  return %2 : i64
}

