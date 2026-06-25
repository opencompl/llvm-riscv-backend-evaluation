func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sdiv %arg1, %arg2 : i64
  %1 = llvm.xor %arg0, %0 : i64
  %2 = llvm.and %1, %1 : i64
  return %2 : i64
}

