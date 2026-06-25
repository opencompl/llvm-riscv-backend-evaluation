func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.udiv %arg1, %arg1 : i64
  %1 = llvm.sdiv %0, %0 : i64
  %2 = llvm.srem %1, %arg2 : i64
  %3 = llvm.select %arg0, %1, %2 : i1, i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

