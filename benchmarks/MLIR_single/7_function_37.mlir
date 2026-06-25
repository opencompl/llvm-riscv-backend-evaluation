func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
  %0 = llvm.or disjoint %arg0, %arg0 : i64
  %1 = llvm.select %arg1, %arg2, %0 : i1, i64
  %2 = llvm.lshr %1, %arg0 : i64
  %3 = llvm.srem %arg0, %2 : i64
  %4 = llvm.and %3, %1 : i64
  %5 = llvm.xor %arg0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

