func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.udiv %arg2, %arg0 : i64
  %4 = llvm.udiv %2, %3 : i64
  %5 = llvm.srem %3, %arg1 : i64
  %6 = llvm.srem %4, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

