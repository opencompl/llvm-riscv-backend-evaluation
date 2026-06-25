func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i1
  %1 = llvm.select %0, %arg1, %arg1 : i1, i64
  %2 = llvm.sext %arg3 : i32 to i64
  %3 = llvm.xor %arg0, %2 : i64
  %4 = llvm.ashr exact %arg2, %3 : i64
  %5 = llvm.and %1, %4 : i64
  %6 = llvm.and %5, %arg0 : i64
  return %6 : i64
}

