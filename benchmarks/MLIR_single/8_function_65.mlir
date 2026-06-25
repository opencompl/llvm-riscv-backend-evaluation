func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.srem %arg1, %arg2 : i64
  %1 = llvm.lshr %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  %6 = llvm.srem %5, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

