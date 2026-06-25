func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.lshr %1, %arg1 : i64
  %3 = llvm.sext %arg2 : i32 to i64
  %4 = llvm.srem %3, %arg1 : i64
  %5 = llvm.lshr exact %4, %3 : i64
  %6 = llvm.ashr exact %2, %5 : i64
  return %6 : i64
}

