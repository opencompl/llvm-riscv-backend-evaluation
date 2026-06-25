func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
  %0 = llvm.select %arg1, %arg2, %arg2 : i1, i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.srem %arg0, %4 : i64
  return %5 : i64
}

