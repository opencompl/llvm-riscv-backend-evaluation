func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sdiv exact %arg2, %arg1 : i64
  %1 = llvm.udiv %arg1, %0 : i64
  %2 = llvm.sdiv exact %1, %1 : i64
  %3 = llvm.or disjoint %arg0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

