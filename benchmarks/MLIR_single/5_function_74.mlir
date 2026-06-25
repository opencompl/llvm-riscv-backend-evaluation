func.func @main(%arg0: i64, %arg1: i1, %arg2: i32) -> i32 {
  %0 = llvm.sext %arg2 : i32 to i64
  %1 = llvm.select %arg1, %arg0, %0 : i1, i64
  %2 = llvm.and %arg0, %1 : i64
  %3 = llvm.lshr exact %2, %arg0 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

