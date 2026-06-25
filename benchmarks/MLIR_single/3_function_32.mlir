func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.lshr %arg0, %arg1 : i64
  %1 = llvm.sdiv exact %0, %arg2 : i64
  %2 = llvm.trunc %1 : i64 to i1
  return %2 : i1
}

