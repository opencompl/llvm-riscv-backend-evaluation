func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i1
  %1 = llvm.and %arg0, %arg0 : i64
  %2 = llvm.select %0, %1, %1 : i1, i64
  %3 = llvm.lshr exact %2, %arg1 : i64
  %4 = llvm.or %3, %arg1 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

