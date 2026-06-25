func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.or disjoint %arg0, %arg0 : i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.select %1, %arg0, %arg1 : i1, i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

