func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg1 : i32 to i64
  %1 = llvm.or disjoint %arg0, %0 : i64
  %2 = llvm.srem %0, %arg2 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.urem %arg0, %4 : i64
  %6 = llvm.urem %5, %arg2 : i64
  %7 = llvm.sdiv exact %1, %6 : i64
  return %7 : i64
}

