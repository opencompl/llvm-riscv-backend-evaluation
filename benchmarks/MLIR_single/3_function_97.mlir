func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i1
  %1 = llvm.or %arg1, %arg0 : i64
  %2 = llvm.select %0, %arg0, %1 : i1, i64
  return %2 : i64
}

