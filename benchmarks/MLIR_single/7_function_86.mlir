func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i32 {
  %0 = llvm.sext %arg1 : i32 to i64
  %1 = llvm.or disjoint %0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.srem %3, %arg2 : i64
  %5 = llvm.udiv %arg0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

