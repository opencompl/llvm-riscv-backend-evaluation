func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.udiv %arg1, %arg2 : i64
  %1 = llvm.xor %0, %0 : i64
  %2 = llvm.udiv %0, %1 : i64
  %3 = llvm.urem %2, %0 : i64
  %4 = llvm.udiv %arg0, %3 : i64
  %5 = llvm.ashr %4, %2 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

