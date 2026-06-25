func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.sdiv %arg1, %arg1 : i64
  %1 = llvm.or %0, %arg2 : i64
  %2 = llvm.or %1, %arg0 : i64
  %3 = llvm.sdiv exact %arg0, %2 : i64
  %4 = llvm.xor %3, %arg0 : i64
  %5 = llvm.srem %arg0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

