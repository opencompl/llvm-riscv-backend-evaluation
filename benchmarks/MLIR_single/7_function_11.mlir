func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.xor %0, %arg1 : i64
  %2 = llvm.lshr exact %arg2, %0 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.sdiv exact %1, %4 : i64
  %6 = llvm.srem %0, %5 : i64
  return %6 : i64
}

