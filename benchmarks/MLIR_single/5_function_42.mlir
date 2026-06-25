func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.ashr exact %arg0, %arg0 : i64
  %1 = llvm.xor %0, %arg0 : i64
  %2 = llvm.or disjoint %0, %1 : i64
  %3 = llvm.udiv %arg1, %arg2 : i64
  %4 = llvm.icmp "eq" %2, %3 : i64
  return %4 : i1
}

