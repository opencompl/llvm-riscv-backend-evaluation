func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i64 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.trunc %arg1 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.and %0, %2 : i64
  %4 = llvm.select %arg2, %0, %arg0 : i1, i64
  %5 = llvm.lshr %3, %4 : i64
  return %5 : i64
}

