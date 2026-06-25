func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.and %arg1, %arg0 : i64
  %3 = llvm.xor %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  %5 = llvm.select %4, %arg2, %1 : i1, i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

