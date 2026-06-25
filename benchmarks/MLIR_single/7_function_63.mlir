func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.lshr %arg2, %arg2 : i64
  %2 = llvm.udiv %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.sdiv %4, %arg0 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

