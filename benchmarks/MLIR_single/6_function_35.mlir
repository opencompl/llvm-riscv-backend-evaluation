func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg1 : i32 to i64
  %1 = llvm.srem %arg2, %arg0 : i64
  %2 = llvm.udiv %0, %1 : i64
  %3 = llvm.zext %arg1 : i32 to i64
  %4 = llvm.lshr %2, %3 : i64
  %5 = llvm.sdiv exact %arg0, %4 : i64
  return %5 : i64
}

