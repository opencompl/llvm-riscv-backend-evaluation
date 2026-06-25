func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.ashr %arg0, %arg1 : i64
  %1 = llvm.srem %arg0, %0 : i64
  %2 = llvm.ashr exact %1, %arg0 : i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

