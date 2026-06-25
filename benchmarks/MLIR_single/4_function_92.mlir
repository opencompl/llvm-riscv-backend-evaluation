func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.sdiv exact %0, %arg1 : i64
  %2 = llvm.and %1, %arg2 : i64
  %3 = llvm.xor %2, %1 : i64
  return %3 : i64
}

