func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
  %0 = llvm.urem %arg0, %arg0 : i64
  %1 = llvm.urem %0, %0 : i64
  %2 = llvm.select %arg1, %arg2, %arg2 : i1, i64
  %3 = llvm.ashr exact %1, %2 : i64
  %4 = llvm.urem %2, %arg2 : i64
  %5 = llvm.and %3, %4 : i64
  return %5 : i64
}

