func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.xor %0, %arg0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

