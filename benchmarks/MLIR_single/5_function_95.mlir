func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.or %arg1, %arg0 : i64
  %1 = llvm.or disjoint %0, %arg0 : i64
  %2 = llvm.lshr exact %1, %arg2 : i64
  %3 = llvm.lshr exact %arg0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

