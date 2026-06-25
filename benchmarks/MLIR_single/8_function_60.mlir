func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.trunc %arg1 : i64 to i1
  %3 = llvm.select %2, %arg2, %arg0 : i1, i64
  %4 = llvm.srem %arg1, %3 : i64
  %5 = llvm.xor %arg0, %4 : i64
  %6 = llvm.sdiv %1, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

