func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.ashr exact %arg1, %arg2 : i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.and %3, %1 : i64
  %5 = llvm.xor %arg0, %4 : i64
  return %5 : i64
}

