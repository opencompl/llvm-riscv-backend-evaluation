func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.or disjoint %arg2, %arg1 : i64
  %2 = llvm.xor %0, %1 : i64
  %3 = llvm.srem %2, %1 : i64
  return %3 : i64
}

