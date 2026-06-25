func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.and %0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i1
  %3 = llvm.udiv %arg0, %arg0 : i64
  %4 = llvm.or %3, %1 : i64
  %5 = llvm.and %arg1, %arg2 : i64
  %6 = llvm.select %2, %4, %5 : i1, i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

