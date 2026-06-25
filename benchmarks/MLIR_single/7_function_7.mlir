func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i1 {
  %0 = llvm.lshr exact %arg2, %arg0 : i64
  %1 = llvm.and %arg1, %0 : i64
  %2 = llvm.lshr exact %arg0, %1 : i64
  %3 = llvm.urem %2, %1 : i64
  %4 = llvm.sext %arg3 : i32 to i64
  %5 = llvm.or %4, %3 : i64
  %6 = llvm.icmp "ult" %3, %5 : i64
  return %6 : i1
}

