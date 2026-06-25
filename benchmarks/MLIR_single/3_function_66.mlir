func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
  %0 = llvm.lshr exact %arg0, %arg1 : i64
  %1 = llvm.zext %arg2 : i32 to i64
  %2 = llvm.ashr %0, %1 : i64
  return %2 : i64
}

