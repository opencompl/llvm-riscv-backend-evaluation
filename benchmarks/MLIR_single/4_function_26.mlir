func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
  %1 = llvm.icmp "eq" %0, %arg2 : i64
  %2 = llvm.select %1, %arg2, %arg1 : i1, i64
  %3 = llvm.xor %0, %2 : i64
  return %3 : i64
}

