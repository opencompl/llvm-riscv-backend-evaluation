func.func @main(%arg0: i32, %arg1: i64) -> i64 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.or %arg1, %0 : i64
  %2 = llvm.xor %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  return %4 : i64
}

