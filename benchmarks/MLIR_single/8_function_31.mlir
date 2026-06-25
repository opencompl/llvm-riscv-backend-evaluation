func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.srem %arg1, %arg0 : i64
  %1 = llvm.udiv %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.lshr %1, %arg2 : i64
  %5 = llvm.icmp "ult" %3, %4 : i64
  %6 = llvm.srem %3, %0 : i64
  %7 = llvm.select %5, %arg2, %6 : i1, i64
  return %7 : i64
}

