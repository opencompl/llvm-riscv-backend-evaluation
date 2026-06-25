func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.urem %arg0, %arg0 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.or disjoint %0, %arg1 : i64
  %4 = llvm.and %arg0, %3 : i64
  %5 = llvm.xor %2, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  %7 = llvm.zext %6 : i32 to i64
  return %7 : i64
}

