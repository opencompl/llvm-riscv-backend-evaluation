func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.lshr %arg1, %arg2 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.lshr %arg0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

