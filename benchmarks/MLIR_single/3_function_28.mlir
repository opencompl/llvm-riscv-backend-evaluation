func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.or disjoint %arg2, %arg1 : i64
  %1 = llvm.select %arg0, %arg1, %0 : i1, i64
  %2 = llvm.icmp "eq" %1, %arg2 : i64
  return %2 : i1
}

