func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.ashr exact %arg0, %arg0 : i64
  %1 = llvm.ashr %0, %arg0 : i64
  %2 = llvm.ashr exact %arg0, %1 : i64
  %3 = llvm.sdiv %arg0, %2 : i64
  %4 = llvm.xor %0, %arg1 : i64
  %5 = llvm.xor %3, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

