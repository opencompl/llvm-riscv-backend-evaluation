func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.udiv %arg1, %arg2 : i64
  %2 = llvm.icmp "uge" %1, %arg1 : i64
  %3 = llvm.select %2, %arg1, %1 : i1, i64
  %4 = llvm.and %0, %3 : i64
  %5 = llvm.xor %3, %4 : i64
  %6 = llvm.udiv %4, %5 : i64
  return %6 : i64
}

