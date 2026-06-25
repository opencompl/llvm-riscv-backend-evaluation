func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i1
  %1 = llvm.select %0, %arg0, %arg1 : i1, i64
  %2 = llvm.sdiv exact %arg2, %arg1 : i64
  %3 = llvm.ashr exact %1, %2 : i64
  %4 = llvm.and %3, %1 : i64
  %5 = llvm.sdiv exact %4, %arg1 : i64
  %6 = llvm.sdiv %3, %5 : i64
  %7 = llvm.ashr exact %4, %6 : i64
  return %7 : i64
}

