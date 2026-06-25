func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
  %0 = llvm.zext %arg2 : i32 to i64
  %1 = llvm.sdiv exact %arg1, %0 : i64
  %2 = llvm.xor %arg0, %1 : i64
  %3 = llvm.or %2, %arg1 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

