func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.udiv %arg1, %arg2 : i64
  %2 = llvm.ashr exact %0, %1 : i64
  %3 = llvm.lshr %2, %arg2 : i64
  %4 = llvm.ashr exact %3, %0 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

