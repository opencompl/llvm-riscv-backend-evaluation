func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.srem %0, %arg1 : i64
  %2 = llvm.urem %0, %1 : i64
  %3 = llvm.trunc %arg2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.ashr %2, %4 : i64
  return %5 : i64
}

