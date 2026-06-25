func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i64 {
  %0 = llvm.or %arg0, %arg0 : i64
  %1 = llvm.or disjoint %0, %arg1 : i64
  %2 = llvm.and %0, %1 : i64
  %3 = llvm.select %arg2, %2, %2 : i1, i64
  %4 = llvm.xor %arg0, %3 : i64
  %5 = llvm.or disjoint %2, %4 : i64
  return %5 : i64
}

