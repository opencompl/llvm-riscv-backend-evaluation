func.func @main(%arg0: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.ashr %0, %arg0 : i64
  %2 = llvm.or disjoint %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  return %4 : i64
}

