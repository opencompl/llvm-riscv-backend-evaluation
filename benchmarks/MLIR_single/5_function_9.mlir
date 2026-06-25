func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
  %1 = llvm.xor %arg1, %arg2 : i64
  %2 = llvm.ashr exact %arg1, %1 : i64
  %3 = llvm.ashr %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

