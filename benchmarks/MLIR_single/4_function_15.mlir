func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
  %1 = llvm.urem %0, %arg2 : i64
  %2 = llvm.lshr exact %1, %arg1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

