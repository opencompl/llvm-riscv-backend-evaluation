func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i1 {
  %0 = llvm.xor %arg0, %arg0 : i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.select %1, %arg0, %arg1 : i1, i64
  %3 = llvm.select %arg2, %0, %arg1 : i1, i64
  %4 = llvm.srem %2, %3 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

