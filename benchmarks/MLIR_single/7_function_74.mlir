func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
  %0 = llvm.zext %arg2 : i32 to i64
  %1 = llvm.lshr exact %arg1, %0 : i64
  %2 = llvm.udiv %1, %arg0 : i64
  %3 = llvm.xor %2, %1 : i64
  %4 = llvm.xor %arg0, %3 : i64
  %5 = llvm.xor %4, %arg1 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

