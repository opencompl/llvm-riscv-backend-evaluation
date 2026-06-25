func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.lshr exact %arg0, %arg0 : i64
  %1 = llvm.and %arg1, %0 : i64
  %2 = llvm.xor %0, %1 : i64
  %3 = llvm.urem %arg2, %0 : i64
  %4 = llvm.sdiv exact %3, %0 : i64
  %5 = llvm.ashr exact %2, %4 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

