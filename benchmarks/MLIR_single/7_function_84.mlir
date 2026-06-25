func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.or disjoint %0, %arg0 : i64
  %2 = llvm.and %arg2, %1 : i64
  %3 = llvm.xor %2, %arg1 : i64
  %4 = llvm.and %0, %3 : i64
  %5 = llvm.srem %4, %0 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

