func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.urem %1, %arg1 : i64
  %3 = llvm.icmp "ule" %1, %2 : i64
  %4 = llvm.udiv %arg1, %arg2 : i64
  %5 = llvm.urem %4, %arg1 : i64
  %6 = llvm.select %3, %arg1, %5 : i1, i64
  return %6 : i64
}

