func.func @main(%arg0: i64, %arg1: i1, %arg2: i32) -> i1 {
  %0 = llvm.sext %arg2 : i32 to i64
  %1 = llvm.icmp "eq" %0, %arg0 : i64
  %2 = llvm.select %arg1, %arg0, %arg0 : i1, i64
  %3 = llvm.select %1, %0, %2 : i1, i64
  %4 = llvm.lshr exact %arg0, %0 : i64
  %5 = llvm.select %arg1, %3, %4 : i1, i64
  %6 = llvm.lshr exact %arg0, %5 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

