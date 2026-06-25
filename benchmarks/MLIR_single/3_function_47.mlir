func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.sdiv exact %arg2, %arg2 : i64
  %2 = llvm.urem %0, %1 : i64
  return %2 : i64
}

