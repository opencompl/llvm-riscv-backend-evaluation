func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.and %0, %arg2 : i64
  %2 = llvm.select %arg1, %0, %1 : i1, i64
  %3 = llvm.sdiv %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

