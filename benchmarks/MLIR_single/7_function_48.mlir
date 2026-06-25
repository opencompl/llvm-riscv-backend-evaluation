func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.udiv %0, %arg1 : i64
  %2 = llvm.srem %arg2, %1 : i64
  %3 = llvm.xor %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

