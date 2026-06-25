func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.lshr exact %arg0, %arg1 : i64
  %1 = llvm.xor %0, %arg2 : i64
  %2 = llvm.ashr %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i1
  %4 = llvm.select %3, %0, %arg2 : i1, i64
  %5 = llvm.urem %2, %4 : i64
  return %5 : i64
}

