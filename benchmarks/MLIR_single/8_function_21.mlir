func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg1 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.srem %arg0, %1 : i64
  %3 = llvm.udiv %arg2, %arg1 : i64
  %4 = llvm.and %2, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

