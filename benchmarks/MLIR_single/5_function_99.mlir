func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
  %1 = llvm.xor %0, %arg2 : i64
  %2 = llvm.sdiv %arg2, %arg2 : i64
  %3 = llvm.udiv %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

