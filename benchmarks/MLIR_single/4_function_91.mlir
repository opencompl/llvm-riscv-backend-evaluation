func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.ashr exact %arg1, %arg2 : i64
  %1 = llvm.or disjoint %arg0, %0 : i64
  %2 = llvm.ashr %arg1, %0 : i64
  %3 = llvm.sdiv %1, %2 : i64
  return %3 : i64
}

