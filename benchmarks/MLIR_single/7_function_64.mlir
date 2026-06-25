func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg2 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.ashr exact %arg1, %1 : i64
  %3 = llvm.xor %arg0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

