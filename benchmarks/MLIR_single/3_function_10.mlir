func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.srem %0, %arg1 : i64
  %2 = llvm.trunc %1 : i64 to i32
  return %2 : i32
}

