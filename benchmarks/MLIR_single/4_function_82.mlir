func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.or disjoint %arg0, %arg0 : i64
  %1 = llvm.trunc %arg1 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.xor %0, %2 : i64
  return %3 : i64
}

