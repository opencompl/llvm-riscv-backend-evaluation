func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.srem %arg1, %arg2 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.udiv %arg0, %2 : i64
  %4 = llvm.udiv %3, %3 : i64
  %5 = llvm.xor %4, %3 : i64
  %6 = llvm.ashr %3, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

