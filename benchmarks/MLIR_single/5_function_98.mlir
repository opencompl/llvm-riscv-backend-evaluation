func.func @main(%arg0: i1, %arg1: i64) -> i32 {
  %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
  %1 = llvm.lshr %arg1, %0 : i64
  %2 = llvm.sdiv exact %1, %arg1 : i64
  %3 = llvm.and %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

