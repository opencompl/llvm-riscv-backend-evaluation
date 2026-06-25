func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.xor %arg1, %arg1 : i64
  %1 = llvm.xor %arg2, %arg1 : i64
  %2 = llvm.or disjoint %0, %1 : i64
  %3 = llvm.urem %arg0, %2 : i64
  return %3 : i64
}

