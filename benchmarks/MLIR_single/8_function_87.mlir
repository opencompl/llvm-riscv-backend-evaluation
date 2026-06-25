func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.urem %0, %arg1 : i64
  %2 = llvm.lshr %1, %arg1 : i64
  %3 = llvm.trunc %arg2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.ashr exact %2, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  %7 = llvm.sext %6 : i32 to i64
  return %7 : i64
}

