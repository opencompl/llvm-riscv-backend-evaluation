func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.icmp "uge" %arg0, %arg0 : i64
  %1 = llvm.urem %arg1, %arg0 : i64
  %2 = llvm.or disjoint %1, %1 : i64
  %3 = llvm.urem %arg2, %2 : i64
  %4 = llvm.select %0, %1, %3 : i1, i64
  return %4 : i64
}

