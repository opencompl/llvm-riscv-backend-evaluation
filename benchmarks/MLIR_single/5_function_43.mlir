func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.lshr %arg0, %arg1 : i64
  %1 = llvm.srem %0, %arg2 : i64
  %2 = llvm.urem %0, %1 : i64
  %3 = llvm.and %2, %arg2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

