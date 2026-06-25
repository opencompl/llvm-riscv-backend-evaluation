func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.xor %arg0, %arg0 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.udiv %4, %arg1 : i64
  %6 = llvm.ashr %1, %5 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

