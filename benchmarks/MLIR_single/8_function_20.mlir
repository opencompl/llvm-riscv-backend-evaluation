func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.ashr %arg0, %arg1 : i64
  %1 = llvm.srem %0, %arg2 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.lshr exact %3, %1 : i64
  %5 = llvm.udiv %0, %4 : i64
  %6 = llvm.and %5, %arg0 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

