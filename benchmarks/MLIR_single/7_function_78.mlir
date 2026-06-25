func.func @main(%arg0: i64, %arg1: i32) -> i1 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.sext %arg1 : i32 to i64
  %2 = llvm.udiv %1, %0 : i64
  %3 = llvm.trunc %1 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.or %2, %4 : i64
  %6 = llvm.icmp "ule" %0, %5 : i64
  return %6 : i1
}

