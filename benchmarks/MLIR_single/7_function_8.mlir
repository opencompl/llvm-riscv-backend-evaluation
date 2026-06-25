func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.icmp "ule" %arg1, %arg1 : i64
  %1 = llvm.select %0, %arg2, %arg1 : i1, i64
  %2 = llvm.select %arg0, %arg1, %1 : i1, i64
  %3 = llvm.or disjoint %arg2, %arg1 : i64
  %4 = llvm.urem %1, %3 : i64
  %5 = llvm.or %4, %3 : i64
  %6 = llvm.icmp "ne" %2, %5 : i64
  return %6 : i1
}

