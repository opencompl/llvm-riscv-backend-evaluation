func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.ashr exact %arg0, %arg0 : i64
  %1 = llvm.lshr %0, %arg1 : i64
  %2 = llvm.sdiv %arg0, %arg0 : i64
  %3 = llvm.udiv %1, %2 : i64
  return %3 : i64
}

