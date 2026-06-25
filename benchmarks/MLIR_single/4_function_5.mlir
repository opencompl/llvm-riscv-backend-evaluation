func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
  %0 = llvm.ashr %arg0, %arg0 : i64
  %1 = llvm.select %arg1, %arg2, %arg2 : i1, i64
  %2 = llvm.ashr %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

