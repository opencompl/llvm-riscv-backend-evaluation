func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.srem %arg2, %arg2 : i64
  %3 = llvm.urem %2, %arg1 : i64
  %4 = llvm.udiv %arg1, %3 : i64
  %5 = llvm.or %1, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

