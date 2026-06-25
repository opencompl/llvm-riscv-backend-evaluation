func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.or %arg0, %arg0 : i64
  %1 = llvm.and %0, %arg0 : i64
  %2 = llvm.trunc %arg1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.udiv %3, %arg2 : i64
  %5 = llvm.icmp "ne" %1, %4 : i64
  return %5 : i1
}

