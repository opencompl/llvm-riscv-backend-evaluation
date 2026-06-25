func.func @main(%arg0: i1, %arg1: i1, %arg2: i64) -> i32 {
  %0 = llvm.select %arg1, %arg2, %arg2 : i1, i64
  %1 = llvm.and %arg2, %0 : i64
  %2 = llvm.lshr %1, %0 : i64
  %3 = llvm.lshr %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.select %arg0, %5, %arg2 : i1, i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

