func.func @main(%arg0: i1, %arg1: i64, %arg2: i1) -> i64 {
  %0 = llvm.srem %arg1, %arg1 : i64
  %1 = llvm.select %arg2, %0, %arg1 : i1, i64
  %2 = llvm.select %arg0, %arg1, %1 : i1, i64
  %3 = llvm.srem %2, %0 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  return %5 : i64
}

