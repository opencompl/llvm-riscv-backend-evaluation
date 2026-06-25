func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.sdiv exact %arg0, %1 : i64
  %3 = llvm.udiv %arg0, %arg2 : i64
  %4 = llvm.lshr exact %arg1, %3 : i64
  %5 = llvm.urem %1, %arg1 : i64
  %6 = llvm.xor %4, %5 : i64
  %7 = llvm.srem %2, %6 : i64
  return %7 : i64
}

