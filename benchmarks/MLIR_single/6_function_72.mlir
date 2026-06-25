func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.xor %arg0, %arg1 : i64
  %1 = llvm.sdiv %arg2, %arg2 : i64
  %2 = llvm.udiv %arg0, %1 : i64
  %3 = llvm.sdiv %0, %2 : i64
  %4 = llvm.srem %3, %0 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

