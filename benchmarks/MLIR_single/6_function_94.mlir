func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
  %1 = llvm.select %arg0, %arg2, %arg2 : i1, i64
  %2 = llvm.urem %1, %1 : i64
  %3 = llvm.or %2, %1 : i64
  %4 = llvm.udiv %3, %0 : i64
  %5 = llvm.sdiv %0, %4 : i64
  return %5 : i64
}

