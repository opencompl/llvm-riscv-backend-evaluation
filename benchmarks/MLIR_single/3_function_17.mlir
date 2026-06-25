func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.and %0, %arg1 : i64
  %2 = llvm.and %1, %arg2 : i64
  return %2 : i64
}

