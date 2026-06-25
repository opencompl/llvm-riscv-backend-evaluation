func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
  %0 = llvm.select %arg1, %arg0, %arg2 : i1, i64
  %1 = llvm.ashr exact %0, %arg0 : i64
  %2 = llvm.and %arg0, %1 : i64
  %3 = llvm.lshr exact %arg0, %arg0 : i64
  %4 = llvm.ashr exact %2, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  %7 = llvm.urem %arg0, %6 : i64
  return %7 : i64
}

