func.func @main(%arg0: i1, %arg1: i64) -> i64 {
  %0 = llvm.urem %arg1, %arg1 : i64
  %1 = llvm.ashr exact %arg1, %0 : i64
  %2 = llvm.lshr %1, %arg1 : i64
  %3 = llvm.select %arg0, %2, %2 : i1, i64
  return %3 : i64
}

