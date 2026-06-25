func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sdiv %arg0, %arg0 : i64
  %1 = llvm.srem %0, %arg1 : i64
  %2 = llvm.trunc %1 : i64 to i1
  %3 = llvm.select %2, %arg2, %0 : i1, i64
  return %3 : i64
}

