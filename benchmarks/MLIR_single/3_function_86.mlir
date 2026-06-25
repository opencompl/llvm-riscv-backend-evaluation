func.func @main(%arg0: i1, %arg1: i32, %arg2: i64) -> i32 {
  %0 = llvm.zext %arg1 : i32 to i64
  %1 = llvm.select %arg0, %0, %arg2 : i1, i64
  %2 = llvm.trunc %1 : i64 to i32
  return %2 : i32
}

