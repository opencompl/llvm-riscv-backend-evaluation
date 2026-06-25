func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.lshr exact %arg1, %arg2 : i64
  %3 = llvm.urem %1, %2 : i64
  %4 = llvm.lshr exact %1, %3 : i64
  %5 = llvm.trunc %arg2 : i64 to i32
  %6 = llvm.zext %5 : i32 to i64
  %7 = llvm.icmp "ult" %4, %6 : i64
  return %7 : i1
}

