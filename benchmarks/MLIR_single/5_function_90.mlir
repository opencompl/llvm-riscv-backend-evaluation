func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.ashr %0, %arg1 : i64
  %2 = llvm.ashr exact %arg1, %0 : i64
  %3 = llvm.srem %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

