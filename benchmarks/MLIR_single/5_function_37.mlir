func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i1
  %1 = llvm.zext %arg2 : i32 to i64
  %2 = llvm.or disjoint %arg1, %1 : i64
  %3 = llvm.select %0, %arg0, %2 : i1, i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

