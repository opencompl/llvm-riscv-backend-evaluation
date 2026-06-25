func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.ashr %arg0, %0 : i64
  %2 = llvm.udiv %1, %arg2 : i64
  %3 = llvm.urem %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

