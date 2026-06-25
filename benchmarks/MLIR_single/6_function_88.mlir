func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i1 {
  %0 = llvm.select %arg1, %arg2, %arg0 : i1, i64
  %1 = llvm.or disjoint %0, %0 : i64
  %2 = llvm.icmp "slt" %arg0, %1 : i64
  %3 = llvm.select %2, %1, %0 : i1, i64
  %4 = llvm.srem %3, %arg0 : i64
  %5 = llvm.icmp "eq" %3, %4 : i64
  return %5 : i1
}

