func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.lshr exact %0, %0 : i64
  %2 = llvm.udiv %1, %1 : i64
  %3 = llvm.srem %arg2, %2 : i64
  %4 = llvm.urem %arg1, %3 : i64
  %5 = llvm.urem %1, %4 : i64
  %6 = llvm.icmp "sle" %2, %5 : i64
  return %6 : i1
}

