func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.xor %2, %2 : i64
  %4 = llvm.lshr exact %0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

