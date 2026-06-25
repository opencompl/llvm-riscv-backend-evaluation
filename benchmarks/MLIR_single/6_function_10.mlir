func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.xor %arg1, %arg2 : i64
  %1 = llvm.sdiv exact %arg1, %arg2 : i64
  %2 = llvm.sdiv %arg1, %1 : i64
  %3 = llvm.udiv %0, %2 : i64
  %4 = llvm.lshr %arg0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

