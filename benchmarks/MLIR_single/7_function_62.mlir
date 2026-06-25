func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.xor %arg1, %arg2 : i64
  %3 = llvm.or disjoint %1, %2 : i64
  %4 = llvm.xor %arg0, %3 : i64
  %5 = llvm.urem %4, %4 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

