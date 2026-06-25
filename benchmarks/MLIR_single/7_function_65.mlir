func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.and %0, %arg1 : i64
  %2 = llvm.and %1, %arg1 : i64
  %3 = llvm.sdiv %1, %2 : i64
  %4 = llvm.ashr %1, %3 : i64
  %5 = llvm.srem %4, %arg2 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

