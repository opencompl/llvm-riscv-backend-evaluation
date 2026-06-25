func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.udiv %arg1, %arg2 : i64
  %2 = llvm.sdiv %1, %arg2 : i64
  %3 = llvm.xor %0, %2 : i64
  %4 = llvm.trunc %arg2 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.ashr %3, %5 : i64
  %7 = llvm.and %6, %arg2 : i64
  return %7 : i64
}

