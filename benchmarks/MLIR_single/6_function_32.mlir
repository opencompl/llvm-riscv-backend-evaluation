func.func @main(%arg0: i64, %arg1: i32, %arg2: i32) -> i32 {
  %0 = llvm.zext %arg1 : i32 to i64
  %1 = llvm.xor %arg0, %0 : i64
  %2 = llvm.sext %arg2 : i32 to i64
  %3 = llvm.udiv %2, %2 : i64
  %4 = llvm.srem %1, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

