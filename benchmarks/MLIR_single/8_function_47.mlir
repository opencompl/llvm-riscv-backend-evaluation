func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.srem %0, %0 : i64
  %3 = llvm.select %1, %2, %arg1 : i1, i64
  %4 = llvm.xor %arg1, %arg1 : i64
  %5 = llvm.udiv %4, %arg2 : i64
  %6 = llvm.srem %3, %5 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

