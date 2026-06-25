func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i32 {
  %0 = llvm.lshr exact %arg0, %arg1 : i64
  %1 = llvm.select %arg2, %0, %arg0 : i1, i64
  %2 = llvm.or %arg0, %1 : i64
  %3 = llvm.srem %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

