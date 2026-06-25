func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i32 {
  %0 = llvm.sext %arg1 : i32 to i64
  %1 = llvm.sdiv %arg0, %0 : i64
  %2 = llvm.udiv %arg0, %1 : i64
  %3 = llvm.or disjoint %2, %arg2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

