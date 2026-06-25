func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i1 {
  %0 = llvm.zext %arg1 : i32 to i64
  %1 = llvm.srem %arg0, %0 : i64
  %2 = llvm.lshr %arg2, %arg2 : i64
  %3 = llvm.sdiv %arg2, %2 : i64
  %4 = llvm.ashr %1, %3 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

