func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.srem %arg2, %arg0 : i64
  %1 = llvm.sdiv exact %arg1, %0 : i64
  %2 = llvm.xor %arg0, %1 : i64
  %3 = llvm.lshr exact %2, %arg0 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

