func.func @main(%arg0: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.or disjoint %arg0, %1 : i64
  return %2 : i64
}

