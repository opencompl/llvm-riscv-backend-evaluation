func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.ashr %arg0, %arg1 : i64
  %1 = llvm.urem %0, %arg2 : i64
  %2 = llvm.trunc %arg2 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.lshr exact %1, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

