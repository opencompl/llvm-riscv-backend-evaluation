func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.sdiv %arg2, %arg2 : i64
  %2 = llvm.trunc %1 : i64 to i1
  %3 = llvm.select %2, %arg2, %1 : i1, i64
  %4 = llvm.sdiv %0, %3 : i64
  %5 = llvm.lshr exact %4, %1 : i64
  return %5 : i64
}

