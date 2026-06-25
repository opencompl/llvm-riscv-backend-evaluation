func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.zext %arg2 : i32 to i64
  %2 = llvm.lshr %0, %1 : i64
  %3 = llvm.and %arg1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.xor %2, %5 : i64
  %7 = llvm.icmp "sle" %6, %6 : i64
  return %7 : i1
}

