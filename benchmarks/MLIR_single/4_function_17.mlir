func.func @main(%arg0: i1, %arg1: i64, %arg2: i32) -> i64 {
  %0 = llvm.sext %arg2 : i32 to i64
  %1 = llvm.udiv %0, %arg1 : i64
  %2 = llvm.select %arg0, %arg1, %1 : i1, i64
  %3 = llvm.srem %2, %arg1 : i64
  return %3 : i64
}

