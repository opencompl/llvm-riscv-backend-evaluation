func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i64 {
  %0 = llvm.icmp "ule" %arg0, %arg1 : i64
  %1 = llvm.or %arg0, %arg1 : i64
  %2 = llvm.udiv %arg1, %arg2 : i64
  %3 = llvm.xor %1, %2 : i64
  %4 = llvm.xor %arg0, %3 : i64
  %5 = llvm.and %3, %4 : i64
  %6 = llvm.zext %arg3 : i32 to i64
  %7 = llvm.select %0, %5, %6 : i1, i64
  return %7 : i64
}

