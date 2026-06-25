func.func @main(%arg0: i64, %arg1: i64, %arg2: i1, %arg3: i32) -> i32 {
  %0 = llvm.select %arg2, %arg0, %arg0 : i1, i64
  %1 = llvm.sext %arg3 : i32 to i64
  %2 = llvm.udiv %0, %1 : i64
  %3 = llvm.and %arg1, %2 : i64
  %4 = llvm.select %arg2, %3, %arg0 : i1, i64
  %5 = llvm.and %3, %4 : i64
  %6 = llvm.and %arg0, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

