func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
  %1 = llvm.srem %0, %arg1 : i64
  %2 = llvm.trunc %1 : i64 to i32
  return %2 : i32
}

