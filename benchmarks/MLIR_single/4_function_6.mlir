func.func @main(%arg0: i1, %arg1: i64, %arg2: i32) -> i64 {
  %0 = llvm.zext %arg2 : i32 to i64
  %1 = llvm.lshr %arg1, %0 : i64
  %2 = llvm.select %arg0, %1, %1 : i1, i64
  %3 = llvm.or disjoint %2, %2 : i64
  return %3 : i64
}

