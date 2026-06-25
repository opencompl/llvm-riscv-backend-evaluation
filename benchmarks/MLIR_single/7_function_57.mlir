func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.ashr exact %arg1, %arg0 : i64
  %1 = llvm.srem %arg0, %0 : i64
  %2 = llvm.or %arg2, %arg2 : i64
  %3 = llvm.and %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

