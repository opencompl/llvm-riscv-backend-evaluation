func.func @main(%arg0: i32, %arg1: i32, %arg2: i1) -> i64 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.srem %0, %2 : i64
  %4 = llvm.sext %arg1 : i32 to i64
  %5 = llvm.select %arg2, %0, %4 : i1, i64
  %6 = llvm.srem %4, %5 : i64
  %7 = llvm.srem %3, %6 : i64
  return %7 : i64
}

