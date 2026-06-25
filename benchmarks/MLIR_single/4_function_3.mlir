func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.trunc %arg2 : i64 to i1
  %2 = llvm.select %1, %0, %arg0 : i1, i64
  %3 = llvm.lshr %0, %2 : i64
  return %3 : i64
}

