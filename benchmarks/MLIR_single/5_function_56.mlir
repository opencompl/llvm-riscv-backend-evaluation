func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.sdiv exact %arg1, %arg1 : i64
  %3 = llvm.udiv %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

