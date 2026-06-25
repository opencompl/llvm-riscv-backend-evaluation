func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) -> i32 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.udiv %0, %0 : i64
  %2 = llvm.udiv %1, %arg2 : i64
  %3 = llvm.or %2, %arg0 : i64
  %4 = llvm.select %arg3, %0, %arg1 : i1, i64
  %5 = llvm.or %3, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

