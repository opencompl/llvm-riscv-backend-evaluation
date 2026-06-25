func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.lshr %arg2, %arg2 : i64
  %1 = llvm.lshr exact %arg1, %0 : i64
  %2 = llvm.lshr %arg0, %1 : i64
  return %2 : i64
}

