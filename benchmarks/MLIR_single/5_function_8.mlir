func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.sdiv %arg0, %arg2 : i64
  %1 = llvm.xor %arg1, %0 : i64
  %2 = llvm.udiv %arg0, %1 : i64
  %3 = llvm.srem %2, %1 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

