func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
  %0 = llvm.lshr exact %arg0, %arg2 : i64
  %1 = llvm.select %arg1, %arg2, %0 : i1, i64
  %2 = llvm.udiv %1, %0 : i64
  %3 = llvm.srem %arg0, %2 : i64
  return %3 : i64
}

