func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i1 {
  %0 = llvm.select %arg1, %arg2, %arg0 : i1, i64
  %1 = llvm.or disjoint %arg0, %0 : i64
  %2 = llvm.and %1, %arg2 : i64
  %3 = llvm.ashr %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

