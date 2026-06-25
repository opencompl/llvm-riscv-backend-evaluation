func.func @main(%arg0: i32, %arg1: i32, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.zext %arg1 : i32 to i64
  %2 = llvm.or disjoint %1, %arg2 : i64
  %3 = llvm.urem %0, %2 : i64
  return %3 : i64
}

