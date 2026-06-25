func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.ashr exact %arg0, %arg2 : i64
  %2 = llvm.urem %1, %arg1 : i64
  %3 = llvm.sdiv %2, %arg1 : i64
  %4 = llvm.lshr %2, %3 : i64
  %5 = llvm.xor %0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

