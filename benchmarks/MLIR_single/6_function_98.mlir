func.func @main(%arg0: i64) -> i1 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.and %0, %arg0 : i64
  %2 = llvm.or %arg0, %1 : i64
  %3 = llvm.trunc %arg0 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.icmp "ne" %2, %4 : i64
  return %5 : i1
}

