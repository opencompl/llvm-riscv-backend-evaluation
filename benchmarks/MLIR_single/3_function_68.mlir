func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.srem %arg1, %arg2 : i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  return %2 : i32
}

