func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.or %0, %arg2 : i64
  %2 = llvm.udiv %arg2, %0 : i64
  %3 = llvm.sdiv exact %1, %2 : i64
  %4 = llvm.udiv %arg0, %3 : i64
  %5 = llvm.urem %0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  %7 = llvm.zext %6 : i32 to i64
  return %7 : i64
}

