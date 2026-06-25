func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.udiv %0, %arg1 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.xor %arg1, %arg2 : i64
  %5 = llvm.udiv %3, %4 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

