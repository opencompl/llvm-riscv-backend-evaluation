func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.srem %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  %6 = llvm.urem %arg2, %arg2 : i64
  %7 = llvm.udiv %5, %6 : i64
  return %7 : i64
}

