func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
  %1 = llvm.trunc %arg2 : i64 to i1
  %2 = llvm.select %1, %arg2, %0 : i1, i64
  %3 = llvm.or disjoint %0, %2 : i64
  %4 = llvm.select %1, %arg1, %0 : i1, i64
  %5 = llvm.sdiv %3, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

