func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
  %0 = llvm.or %arg0, %arg0 : i64
  %1 = llvm.ashr exact %arg0, %0 : i64
  %2 = llvm.select %arg1, %arg2, %arg0 : i1, i64
  %3 = llvm.and %2, %arg0 : i64
  %4 = llvm.or disjoint %3, %2 : i64
  %5 = llvm.udiv %4, %4 : i64
  %6 = llvm.or disjoint %1, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

