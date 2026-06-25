func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.and %arg0, %arg0 : i64
  %1 = llvm.or disjoint %arg0, %0 : i64
  %2 = llvm.icmp "ult" %1, %arg1 : i64
  return %2 : i1
}

