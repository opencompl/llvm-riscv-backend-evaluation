func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.lshr %0, %0 : i64
  %2 = llvm.urem %1, %arg1 : i64
  %3 = llvm.trunc %2 : i64 to i1
  return %3 : i1
}

