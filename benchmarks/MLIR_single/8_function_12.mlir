func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.trunc %arg2 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.lshr %0, %2 : i64
  %4 = llvm.and %arg0, %0 : i64
  %5 = llvm.sdiv exact %arg1, %4 : i64
  %6 = llvm.lshr %3, %5 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

