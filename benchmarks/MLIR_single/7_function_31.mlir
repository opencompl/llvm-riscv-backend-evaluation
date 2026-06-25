func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i1 {
  %0 = llvm.select %arg1, %arg2, %arg0 : i1, i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.and %4, %2 : i64
  %6 = llvm.icmp "ult" %arg0, %5 : i64
  return %6 : i1
}

