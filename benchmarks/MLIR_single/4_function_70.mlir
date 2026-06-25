func.func @main(%arg0: i64, %arg1: i32) -> i64 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.ashr %0, %arg0 : i64
  %2 = llvm.zext %arg1 : i32 to i64
  %3 = llvm.xor %1, %2 : i64
  return %3 : i64
}

