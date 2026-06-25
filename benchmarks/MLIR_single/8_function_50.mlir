func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) -> i1 {
  %0 = llvm.ashr exact %arg0, %arg0 : i64
  %1 = llvm.sdiv %arg1, %arg2 : i64
  %2 = llvm.udiv %0, %1 : i64
  %3 = llvm.or disjoint %0, %2 : i64
  %4 = llvm.or %3, %3 : i64
  %5 = llvm.select %arg3, %4, %2 : i1, i64
  %6 = llvm.lshr exact %2, %5 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

