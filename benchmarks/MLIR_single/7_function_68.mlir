func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.icmp "slt" %arg0, %arg0 : i64
  %1 = llvm.select %0, %arg1, %arg0 : i1, i64
  %2 = llvm.srem %1, %arg0 : i64
  %3 = llvm.and %2, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  %5 = llvm.xor %arg1, %arg2 : i64
  %6 = llvm.select %4, %3, %5 : i1, i64
  return %6 : i64
}

