func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.xor %arg0, %arg0 : i64
  %1 = llvm.sdiv exact %arg0, %arg1 : i64
  %2 = llvm.udiv %0, %1 : i64
  %3 = llvm.and %2, %0 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

