func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.sdiv exact %arg0, %arg1 : i64
  %1 = llvm.trunc %arg0 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.or %arg1, %arg0 : i64
  %4 = llvm.urem %arg2, %3 : i64
  %5 = llvm.sdiv %2, %4 : i64
  %6 = llvm.srem %0, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

