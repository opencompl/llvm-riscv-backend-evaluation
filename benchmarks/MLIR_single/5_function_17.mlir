func.func @main(%arg0: i64, %arg1: i32) -> i32 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.or %0, %arg0 : i64
  %2 = llvm.zext %arg1 : i32 to i64
  %3 = llvm.ashr %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

