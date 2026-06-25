func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.srem %arg0, %0 : i64
  %2 = llvm.sdiv %1, %arg1 : i64
  return %2 : i64
}

