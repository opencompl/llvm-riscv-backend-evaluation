func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.icmp "eq" %arg0, %arg1 : i64
  %1 = llvm.xor %arg1, %arg0 : i64
  %2 = llvm.select %0, %1, %1 : i1, i64
  %3 = llvm.trunc %2 : i64 to i1
  return %3 : i1
}

