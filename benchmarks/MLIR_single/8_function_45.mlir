func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.lshr exact %arg0, %arg0 : i64
  %2 = llvm.urem %0, %1 : i64
  %3 = llvm.sext %arg1 : i32 to i64
  %4 = llvm.ashr %2, %3 : i64
  %5 = llvm.and %arg2, %arg2 : i64
  %6 = llvm.srem %5, %2 : i64
  %7 = llvm.lshr %4, %6 : i64
  return %7 : i64
}

