func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.or disjoint %arg0, %0 : i64
  %2 = llvm.or %arg1, %arg0 : i64
  %3 = llvm.udiv %1, %2 : i64
  %4 = llvm.urem %arg0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

