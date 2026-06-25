func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.ashr exact %arg2, %arg0 : i64
  %1 = llvm.lshr exact %0, %arg2 : i64
  %2 = llvm.udiv %arg1, %1 : i64
  %3 = llvm.sdiv %arg0, %2 : i64
  %4 = llvm.udiv %2, %arg1 : i64
  %5 = llvm.lshr %3, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

