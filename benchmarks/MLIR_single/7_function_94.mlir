func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sdiv exact %arg0, %arg1 : i64
  %1 = llvm.srem %arg2, %arg2 : i64
  %2 = llvm.sdiv exact %1, %arg0 : i64
  %3 = llvm.srem %arg0, %2 : i64
  %4 = llvm.lshr exact %3, %arg0 : i64
  %5 = llvm.sdiv %0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

