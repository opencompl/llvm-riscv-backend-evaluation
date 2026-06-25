func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg1 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.xor %1, %arg2 : i64
  %3 = llvm.or %arg0, %arg0 : i64
  %4 = llvm.srem %3, %1 : i64
  %5 = llvm.xor %2, %4 : i64
  %6 = llvm.lshr exact %arg0, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

