func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.and %arg1, %arg2 : i64
  %1 = llvm.lshr %arg0, %0 : i64
  %2 = llvm.urem %1, %arg1 : i64
  %3 = llvm.xor %2, %2 : i64
  %4 = llvm.xor %3, %0 : i64
  %5 = llvm.urem %4, %arg1 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

