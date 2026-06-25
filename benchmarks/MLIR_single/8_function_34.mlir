func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.ashr %arg0, %arg1 : i64
  %1 = llvm.srem %0, %arg1 : i64
  %2 = llvm.sdiv exact %arg2, %1 : i64
  %3 = llvm.or disjoint %0, %2 : i64
  %4 = llvm.or disjoint %0, %0 : i64
  %5 = llvm.sdiv exact %4, %2 : i64
  %6 = llvm.srem %3, %5 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

