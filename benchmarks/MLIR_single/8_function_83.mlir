func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.sdiv exact %arg0, %arg1 : i64
  %2 = llvm.urem %0, %1 : i64
  %3 = llvm.ashr exact %0, %1 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.lshr exact %2, %5 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

