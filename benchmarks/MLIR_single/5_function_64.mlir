func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.or %0, %arg0 : i64
  %2 = llvm.urem %1, %arg1 : i64
  %3 = llvm.or %arg0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

