func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.lshr %arg0, %arg1 : i64
  %1 = llvm.and %0, %arg0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

