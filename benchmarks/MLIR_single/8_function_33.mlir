func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.urem %0, %arg2 : i64
  %2 = llvm.lshr %1, %0 : i64
  %3 = llvm.trunc %arg1 : i64 to i1
  %4 = llvm.select %3, %2, %1 : i1, i64
  %5 = llvm.urem %2, %4 : i64
  %6 = llvm.and %1, %5 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

