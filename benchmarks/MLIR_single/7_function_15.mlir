func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i32 {
  %0 = llvm.sext %arg1 : i32 to i64
  %1 = llvm.icmp "ule" %arg0, %0 : i64
  %2 = llvm.srem %arg2, %0 : i64
  %3 = llvm.sdiv %arg2, %2 : i64
  %4 = llvm.lshr %arg0, %3 : i64
  %5 = llvm.select %1, %3, %4 : i1, i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

