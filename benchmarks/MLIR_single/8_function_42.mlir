func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sdiv exact %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.lshr %0, %arg2 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.srem %0, %4 : i64
  %6 = llvm.lshr exact %5, %2 : i64
  %7 = llvm.select %1, %arg2, %6 : i1, i64
  return %7 : i64
}

