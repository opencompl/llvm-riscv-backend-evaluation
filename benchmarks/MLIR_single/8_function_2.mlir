func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg1 : i32 to i64
  %1 = llvm.and %0, %0 : i64
  %2 = llvm.sext %arg1 : i32 to i64
  %3 = llvm.urem %arg2, %2 : i64
  %4 = llvm.lshr exact %1, %3 : i64
  %5 = llvm.and %arg0, %4 : i64
  %6 = llvm.urem %arg2, %0 : i64
  %7 = llvm.urem %5, %6 : i64
  return %7 : i64
}

