func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.ashr %0, %arg0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.udiv %1, %arg1 : i64
  %5 = llvm.lshr exact %3, %4 : i64
  return %5 : i64
}

