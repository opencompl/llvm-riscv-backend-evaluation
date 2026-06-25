func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.zext %0 : i32 to i64
  %3 = llvm.ashr exact %1, %2 : i64
  %4 = llvm.lshr %3, %arg1 : i64
  %5 = llvm.and %arg0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

