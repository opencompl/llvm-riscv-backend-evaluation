func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.xor %arg0, %arg0 : i64
  %1 = llvm.sdiv %arg1, %0 : i64
  %2 = llvm.and %arg0, %1 : i64
  %3 = llvm.sdiv %arg1, %1 : i64
  %4 = llvm.srem %2, %3 : i64
  return %4 : i64
}

