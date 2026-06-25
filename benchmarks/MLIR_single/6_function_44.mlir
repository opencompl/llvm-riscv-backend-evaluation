func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.udiv %1, %arg2 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.lshr %arg0, %4 : i64
  return %5 : i64
}

