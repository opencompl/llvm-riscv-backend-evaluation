func.func @main(%arg0: i32, %arg1: i64) -> i64 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.and %0, %0 : i64
  %2 = llvm.trunc %arg1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.or %1, %5 : i64
  return %6 : i64
}

