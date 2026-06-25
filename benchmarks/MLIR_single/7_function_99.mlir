func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sdiv %arg0, %arg1 : i64
  %1 = llvm.and %arg1, %arg2 : i64
  %2 = llvm.sdiv exact %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i1
  %4 = llvm.trunc %0 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.select %3, %arg1, %5 : i1, i64
  return %6 : i64
}

