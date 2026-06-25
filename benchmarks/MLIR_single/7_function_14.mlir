func.func @main(%arg0: i64, %arg1: i32, %arg2: i1) -> i32 {
  %0 = llvm.sext %arg1 : i32 to i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.select %arg2, %0, %0 : i1, i64
  %5 = llvm.or disjoint %3, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

