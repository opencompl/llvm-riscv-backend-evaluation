func.func @main(%arg0: i64) -> i1 {
  %0 = llvm.ashr exact %arg0, %arg0 : i64
  %1 = llvm.and %0, %arg0 : i64
  %2 = llvm.trunc %1 : i64 to i1
  return %2 : i1
}

