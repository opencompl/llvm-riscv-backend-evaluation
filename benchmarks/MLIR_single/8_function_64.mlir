func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.lshr exact %arg0, %arg1 : i64
  %1 = llvm.or disjoint %arg1, %arg1 : i64
  %2 = llvm.udiv %1, %arg2 : i64
  %3 = llvm.xor %arg2, %arg0 : i64
  %4 = llvm.sdiv exact %3, %arg2 : i64
  %5 = llvm.urem %2, %4 : i64
  %6 = llvm.srem %0, %5 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

