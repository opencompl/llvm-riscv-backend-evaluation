func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.and %0, %arg1 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  return %3 : i64
}

