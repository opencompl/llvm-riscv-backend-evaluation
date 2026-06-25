func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.ashr exact %arg0, %2 : i64
  %4 = llvm.or disjoint %arg1, %arg2 : i64
  %5 = llvm.udiv %4, %arg2 : i64
  %6 = llvm.and %3, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

