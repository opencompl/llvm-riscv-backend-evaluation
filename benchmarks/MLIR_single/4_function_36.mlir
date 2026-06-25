func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.urem %arg2, %arg2 : i64
  %2 = llvm.xor %1, %arg0 : i64
  %3 = llvm.urem %0, %2 : i64
  return %3 : i64
}

