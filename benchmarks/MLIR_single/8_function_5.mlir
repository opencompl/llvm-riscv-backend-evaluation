func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.ashr exact %arg1, %arg1 : i64
  %1 = llvm.lshr exact %arg1, %arg2 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.srem %0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  %7 = llvm.icmp "ne" %arg0, %6 : i64
  return %7 : i1
}

