func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.lshr %1, %arg0 : i64
  %3 = llvm.sdiv %2, %arg0 : i64
  %4 = llvm.or disjoint %3, %arg1 : i64
  return %4 : i64
}

