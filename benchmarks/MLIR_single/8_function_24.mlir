func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.and %arg0, %arg0 : i64
  %1 = llvm.trunc %arg1 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.trunc %arg2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.udiv %arg2, %4 : i64
  %6 = llvm.lshr exact %2, %5 : i64
  %7 = llvm.icmp "sle" %0, %6 : i64
  return %7 : i1
}

