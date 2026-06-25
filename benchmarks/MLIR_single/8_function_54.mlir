func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
  %0 = llvm.or %arg0, %arg0 : i64
  %1 = llvm.zext %arg2 : i32 to i64
  %2 = llvm.lshr %arg1, %1 : i64
  %3 = llvm.sext %arg2 : i32 to i64
  %4 = llvm.urem %2, %3 : i64
  %5 = llvm.and %4, %3 : i64
  %6 = llvm.srem %0, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

