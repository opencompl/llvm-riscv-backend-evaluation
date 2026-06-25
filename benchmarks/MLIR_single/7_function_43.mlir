func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.ashr %arg2, %arg1 : i64
  %1 = llvm.select %arg0, %arg1, %0 : i1, i64
  %2 = llvm.select %arg0, %0, %arg2 : i1, i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.urem %1, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

