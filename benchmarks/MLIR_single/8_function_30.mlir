func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i1 {
  %0 = llvm.xor %arg0, %arg0 : i64
  %1 = llvm.zext %arg1 : i32 to i64
  %2 = llvm.and %0, %1 : i64
  %3 = llvm.ashr %arg0, %2 : i64
  %4 = llvm.and %3, %arg2 : i64
  %5 = llvm.lshr %2, %4 : i64
  %6 = llvm.ashr %3, %5 : i64
  %7 = llvm.icmp "slt" %2, %6 : i64
  return %7 : i1
}

