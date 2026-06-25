func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i1 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.select %arg2, %arg0, %0 : i1, i64
  %2 = llvm.lshr %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i1
  return %3 : i1
}

