func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
  %0 = llvm.sdiv exact %arg0, %arg0 : i64
  %1 = llvm.select %arg1, %arg0, %arg0 : i1, i64
  %2 = llvm.urem %0, %1 : i64
  %3 = llvm.and %2, %arg2 : i64
  %4 = llvm.or disjoint %0, %3 : i64
  return %4 : i64
}

