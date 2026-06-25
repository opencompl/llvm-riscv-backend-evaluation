func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg2, %arg0 : i64
  %1 = llvm.or disjoint %arg2, %0 : i64
  %2 = llvm.xor %1, %arg2 : i64
  %3 = llvm.and %2, %2 : i64
  %4 = llvm.xor %arg2, %3 : i64
  %5 = llvm.xor %arg1, %4 : i64
  %6 = llvm.icmp "ne" %arg0, %5 : i64
  return %6 : i1
}

