func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg2 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.ashr %arg1, %3 : i64
  %5 = llvm.or %arg0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

