func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.udiv %arg0, %arg2 : i64
  %2 = llvm.sdiv %arg0, %1 : i64
  %3 = llvm.ashr %0, %2 : i64
  %4 = llvm.lshr exact %arg0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

