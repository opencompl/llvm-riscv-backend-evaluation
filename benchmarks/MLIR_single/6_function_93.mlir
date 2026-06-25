func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.xor %arg2, %arg0 : i64
  %1 = llvm.lshr %arg0, %0 : i64
  %2 = llvm.srem %arg1, %1 : i64
  %3 = llvm.srem %2, %0 : i64
  %4 = llvm.lshr exact %arg0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

