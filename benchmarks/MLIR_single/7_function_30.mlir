func.func @main(%arg0: i1, %arg1: i64) -> i1 {
  %0 = llvm.trunc %arg1 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.select %arg0, %1, %1 : i1, i64
  %3 = llvm.lshr exact %1, %arg1 : i64
  %4 = llvm.and %2, %3 : i64
  %5 = llvm.urem %2, %4 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

