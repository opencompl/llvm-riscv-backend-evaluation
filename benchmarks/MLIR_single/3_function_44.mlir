func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
  %1 = llvm.ashr exact %arg1, %0 : i64
  %2 = llvm.lshr %0, %1 : i64
  return %2 : i64
}

