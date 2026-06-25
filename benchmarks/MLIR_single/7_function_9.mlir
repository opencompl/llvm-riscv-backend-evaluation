func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.xor %arg1, %arg2 : i64
  %1 = llvm.and %arg1, %0 : i64
  %2 = llvm.urem %1, %arg1 : i64
  %3 = llvm.lshr %arg0, %2 : i64
  %4 = llvm.or %arg0, %3 : i64
  %5 = llvm.urem %arg0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

