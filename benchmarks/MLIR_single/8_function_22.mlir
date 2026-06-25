func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i1
  %1 = llvm.lshr %arg0, %arg0 : i64
  %2 = llvm.ashr exact %1, %arg2 : i64
  %3 = llvm.urem %arg1, %2 : i64
  %4 = llvm.lshr %arg2, %arg1 : i64
  %5 = llvm.select %0, %4, %arg0 : i1, i64
  %6 = llvm.select %0, %3, %5 : i1, i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

