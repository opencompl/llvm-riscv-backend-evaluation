func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  return %2 : i64
}

