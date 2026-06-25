func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg1, %arg2 : i64
  %1 = llvm.select %arg0, %arg1, %0 : i1, i64
  %2 = llvm.trunc %1 : i64 to i1
  return %2 : i1
}

