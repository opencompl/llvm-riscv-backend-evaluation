func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.ashr %arg2, %arg1 : i64
  %1 = llvm.and %arg1, %0 : i64
  %2 = llvm.trunc %0 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.select %arg0, %1, %3 : i1, i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

