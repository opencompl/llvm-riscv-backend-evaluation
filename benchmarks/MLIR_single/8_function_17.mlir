func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.urem %0, %arg1 : i64
  %2 = llvm.urem %arg1, %0 : i64
  %3 = llvm.sdiv exact %arg2, %0 : i64
  %4 = llvm.and %2, %3 : i64
  %5 = llvm.xor %arg1, %4 : i64
  %6 = llvm.ashr %1, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

