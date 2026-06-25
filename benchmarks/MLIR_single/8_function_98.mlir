func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.srem %0, %arg1 : i64
  %2 = llvm.or %0, %0 : i64
  %3 = llvm.xor %1, %2 : i64
  %4 = llvm.udiv %arg1, %arg2 : i64
  %5 = llvm.ashr exact %3, %4 : i64
  %6 = llvm.udiv %0, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

