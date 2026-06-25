func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.or %arg0, %arg1 : i64
  %1 = llvm.sdiv exact %0, %arg0 : i64
  %2 = llvm.or %1, %1 : i64
  %3 = llvm.or disjoint %2, %arg0 : i64
  return %3 : i64
}

