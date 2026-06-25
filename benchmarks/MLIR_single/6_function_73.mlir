func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.or disjoint %0, %0 : i64
  %2 = llvm.and %1, %0 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

