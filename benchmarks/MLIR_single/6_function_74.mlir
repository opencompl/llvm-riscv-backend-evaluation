func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.udiv %arg2, %arg2 : i64
  %1 = llvm.udiv %arg1, %0 : i64
  %2 = llvm.or disjoint %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

