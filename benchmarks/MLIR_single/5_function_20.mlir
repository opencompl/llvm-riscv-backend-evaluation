func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.or disjoint %arg2, %arg0 : i64
  %1 = llvm.lshr %arg1, %0 : i64
  %2 = llvm.udiv %arg1, %1 : i64
  %3 = llvm.xor %arg0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

