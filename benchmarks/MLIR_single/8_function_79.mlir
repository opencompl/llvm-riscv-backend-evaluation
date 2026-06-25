func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i1 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.select %arg2, %arg0, %arg1 : i1, i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  %6 = llvm.sdiv exact %arg1, %5 : i64
  %7 = llvm.icmp "ult" %2, %6 : i64
  return %7 : i1
}

