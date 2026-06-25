func.func @main(%arg0: i1, %arg1: i64, %arg2: i32) -> i1 {
  %0 = llvm.zext %arg2 : i32 to i64
  %1 = llvm.select %arg0, %arg1, %0 : i1, i64
  %2 = llvm.and %arg1, %arg1 : i64
  %3 = llvm.xor %2, %1 : i64
  %4 = llvm.lshr exact %1, %3 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

