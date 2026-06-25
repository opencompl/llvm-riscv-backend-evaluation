func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.ashr %arg1, %arg1 : i64
  %1 = llvm.and %0, %arg1 : i64
  %2 = llvm.udiv %0, %1 : i64
  %3 = llvm.and %arg0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

