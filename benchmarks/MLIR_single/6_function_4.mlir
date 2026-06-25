func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.lshr exact %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.ashr exact %2, %arg0 : i64
  %4 = llvm.xor %2, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

