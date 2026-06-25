func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.or %1, %arg1 : i64
  %3 = llvm.or disjoint %2, %arg2 : i64
  return %3 : i64
}

