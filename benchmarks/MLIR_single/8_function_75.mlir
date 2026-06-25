func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.xor %arg2, %arg2 : i64
  %4 = llvm.and %2, %3 : i64
  %5 = llvm.trunc %arg2 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  %7 = llvm.or %4, %6 : i64
  return %7 : i64
}

