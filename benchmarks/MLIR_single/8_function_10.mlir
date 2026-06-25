func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.or %arg0, %0 : i64
  %2 = llvm.xor %1, %arg2 : i64
  %3 = llvm.trunc %2 : i64 to i1
  %4 = llvm.lshr %0, %arg2 : i64
  %5 = llvm.icmp "slt" %4, %2 : i64
  %6 = llvm.select %5, %0, %2 : i1, i64
  %7 = llvm.select %3, %6, %arg2 : i1, i64
  return %7 : i64
}

