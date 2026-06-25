func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg1, %arg2 : i64
  %1 = llvm.and %arg1, %0 : i64
  %2 = llvm.ashr exact %arg0, %1 : i64
  %3 = llvm.lshr exact %2, %1 : i64
  %4 = llvm.udiv %2, %3 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

