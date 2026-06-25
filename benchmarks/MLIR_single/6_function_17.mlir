func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.xor %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.xor %0, %arg2 : i64
  %5 = llvm.xor %3, %4 : i64
  return %5 : i64
}

