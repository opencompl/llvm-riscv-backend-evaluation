func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.lshr exact %arg1, %arg0 : i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.ashr %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i1
  %4 = llvm.select %3, %arg2, %arg1 : i1, i64
  return %4 : i64
}

