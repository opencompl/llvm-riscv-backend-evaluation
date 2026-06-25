func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i1 {
  %0 = llvm.ashr exact %arg0, %arg2 : i64
  %1 = llvm.select %arg1, %0, %arg2 : i1, i64
  %2 = llvm.lshr exact %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i1
  return %3 : i1
}

