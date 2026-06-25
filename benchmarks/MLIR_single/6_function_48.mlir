func.func @main(%arg0: i1, %arg1: i1, %arg2: i64) -> i64 {
  %0 = llvm.srem %arg2, %arg2 : i64
  %1 = llvm.select %arg1, %0, %0 : i1, i64
  %2 = llvm.srem %arg2, %1 : i64
  %3 = llvm.select %arg0, %1, %2 : i1, i64
  %4 = llvm.trunc %3 : i64 to i1
  %5 = llvm.select %4, %1, %3 : i1, i64
  return %5 : i64
}

