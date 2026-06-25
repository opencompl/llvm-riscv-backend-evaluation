func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.sext %arg2 : i32 to i64
  %2 = llvm.udiv %1, %arg1 : i64
  %3 = llvm.udiv %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

