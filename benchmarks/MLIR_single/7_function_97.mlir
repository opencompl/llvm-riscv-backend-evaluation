func.func @main(%arg0: i64, %arg1: i32) -> i64 {
  %0 = llvm.urem %arg0, %arg0 : i64
  %1 = llvm.zext %arg1 : i32 to i64
  %2 = llvm.lshr exact %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.xor %0, %4 : i64
  %6 = llvm.ashr %arg0, %5 : i64
  return %6 : i64
}

