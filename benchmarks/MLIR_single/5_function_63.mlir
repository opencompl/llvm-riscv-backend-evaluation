func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.xor %arg0, %arg1 : i64
  %1 = llvm.trunc %arg2 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.sdiv %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

