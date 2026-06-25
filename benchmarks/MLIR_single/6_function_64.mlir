func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.udiv %arg0, %arg0 : i64
  %2 = llvm.srem %1, %arg0 : i64
  %3 = llvm.ashr exact %arg2, %arg2 : i64
  %4 = llvm.srem %2, %3 : i64
  %5 = llvm.lshr %0, %4 : i64
  return %5 : i64
}

