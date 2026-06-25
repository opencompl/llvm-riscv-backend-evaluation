func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.xor %arg2, %arg1 : i64
  %1 = llvm.or disjoint %arg1, %0 : i64
  %2 = llvm.urem %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

