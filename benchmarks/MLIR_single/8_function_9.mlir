func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.ashr exact %arg0, %arg1 : i64
  %1 = llvm.trunc %arg2 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.urem %2, %0 : i64
  %4 = llvm.and %0, %arg1 : i64
  %5 = llvm.udiv %3, %4 : i64
  %6 = llvm.srem %5, %4 : i64
  %7 = llvm.sdiv %0, %6 : i64
  return %7 : i64
}

