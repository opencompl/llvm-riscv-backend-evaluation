func.func @main(%arg0: i64) -> i64 {
  %0 = llvm.and %arg0, %arg0 : i64
  %1 = llvm.or %arg0, %0 : i64
  %2 = llvm.sdiv exact %arg0, %1 : i64
  return %2 : i64
}

