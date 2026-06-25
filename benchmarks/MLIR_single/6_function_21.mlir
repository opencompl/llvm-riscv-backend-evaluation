func.func @main(%arg0: i1, %arg1: i64, %arg2: i32) -> i64 {
  %0 = llvm.sext %arg2 : i32 to i64
  %1 = llvm.select %arg0, %arg1, %0 : i1, i64
  %2 = llvm.sdiv exact %0, %0 : i64
  %3 = llvm.xor %1, %2 : i64
  %4 = llvm.xor %arg1, %2 : i64
  %5 = llvm.or %3, %4 : i64
  return %5 : i64
}

