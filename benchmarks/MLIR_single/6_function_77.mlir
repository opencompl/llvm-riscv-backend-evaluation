func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.lshr %arg0, %arg1 : i64
  %1 = llvm.trunc %arg2 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.udiv %arg1, %2 : i64
  %4 = llvm.ashr exact %0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

