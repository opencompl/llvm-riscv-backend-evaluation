func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
  %0 = llvm.sdiv exact %arg0, %arg0 : i64
  %1 = llvm.and %arg0, %arg0 : i64
  %2 = llvm.select %arg1, %0, %1 : i1, i64
  %3 = llvm.urem %2, %arg2 : i64
  %4 = llvm.or %0, %3 : i64
  return %4 : i64
}

