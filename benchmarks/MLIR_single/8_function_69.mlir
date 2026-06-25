func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.udiv %arg2, %arg2 : i64
  %2 = llvm.sdiv exact %0, %1 : i64
  %3 = llvm.srem %0, %0 : i64
  %4 = llvm.or disjoint %1, %3 : i64
  %5 = llvm.sdiv exact %1, %4 : i64
  %6 = llvm.sdiv exact %5, %arg2 : i64
  %7 = llvm.srem %2, %6 : i64
  return %7 : i64
}

