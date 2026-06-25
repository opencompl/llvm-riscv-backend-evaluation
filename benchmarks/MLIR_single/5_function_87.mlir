func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg1 : i64 to i1
  %1 = llvm.sdiv %arg2, %arg1 : i64
  %2 = llvm.select %0, %arg2, %1 : i1, i64
  %3 = llvm.or disjoint %arg0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

