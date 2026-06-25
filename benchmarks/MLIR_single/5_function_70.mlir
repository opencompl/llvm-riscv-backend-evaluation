func.func @main(%arg0: i1, %arg1: i64) -> i1 {
  %0 = llvm.trunc %arg1 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.lshr exact %arg1, %1 : i64
  %3 = llvm.select %arg0, %2, %arg1 : i1, i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

