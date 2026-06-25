func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.lshr exact %arg2, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.sdiv %arg1, %2 : i64
  %4 = llvm.udiv %arg0, %3 : i64
  %5 = llvm.srem %4, %4 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

