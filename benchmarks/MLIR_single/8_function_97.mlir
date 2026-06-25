func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.xor %1, %arg1 : i64
  %3 = llvm.zext %arg2 : i32 to i64
  %4 = llvm.urem %3, %arg1 : i64
  %5 = llvm.or %2, %4 : i64
  %6 = llvm.sext %arg2 : i32 to i64
  %7 = llvm.udiv %5, %6 : i64
  return %7 : i64
}

