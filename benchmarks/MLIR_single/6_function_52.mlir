func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.lshr %arg2, %arg0 : i64
  %1 = llvm.or disjoint %arg1, %0 : i64
  %2 = llvm.ashr %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

