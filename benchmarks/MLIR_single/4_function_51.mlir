func.func @main(%arg0: i32, %arg1: i64) -> i32 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.lshr %arg1, %0 : i64
  %2 = llvm.udiv %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

