func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.lshr %arg0, %arg1 : i64
  %1 = llvm.sdiv %0, %0 : i64
  %2 = llvm.and %1, %arg2 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  return %4 : i64
}

