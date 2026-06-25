func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.or %arg0, %arg0 : i64
  %1 = llvm.or disjoint %arg0, %arg1 : i64
  %2 = llvm.xor %1, %arg2 : i64
  %3 = llvm.icmp "ule" %0, %2 : i64
  return %3 : i1
}

