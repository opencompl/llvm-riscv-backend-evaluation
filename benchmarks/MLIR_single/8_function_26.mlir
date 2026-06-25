func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i64 {
  %0 = llvm.and %arg0, %arg0 : i64
  %1 = llvm.sext %arg1 : i32 to i64
  %2 = llvm.udiv %arg0, %1 : i64
  %3 = llvm.and %2, %arg2 : i64
  %4 = llvm.ashr exact %3, %2 : i64
  %5 = llvm.udiv %2, %4 : i64
  %6 = llvm.ashr %0, %5 : i64
  %7 = llvm.sdiv %6, %4 : i64
  return %7 : i64
}

