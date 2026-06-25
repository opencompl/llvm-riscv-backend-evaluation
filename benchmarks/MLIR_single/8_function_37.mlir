func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.xor %arg0, %arg1 : i64
  %1 = llvm.srem %0, %arg0 : i64
  %2 = llvm.udiv %arg1, %1 : i64
  %3 = llvm.or %arg2, %2 : i64
  %4 = llvm.xor %1, %3 : i64
  %5 = llvm.urem %0, %4 : i64
  %6 = llvm.urem %5, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

