func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.lshr exact %arg2, %arg0 : i64
  %1 = llvm.udiv %arg1, %0 : i64
  %2 = llvm.urem %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i1
  return %3 : i1
}

