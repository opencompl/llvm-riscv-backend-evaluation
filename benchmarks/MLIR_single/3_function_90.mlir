func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.srem %arg1, %arg1 : i64
  %1 = llvm.xor %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i1
  return %2 : i1
}

