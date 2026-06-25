func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.ashr exact %1, %arg0 : i64
  %3 = llvm.or %arg2, %1 : i64
  %4 = llvm.sdiv exact %1, %3 : i64
  %5 = llvm.udiv %arg1, %4 : i64
  %6 = llvm.icmp "sle" %2, %5 : i64
  return %6 : i1
}

