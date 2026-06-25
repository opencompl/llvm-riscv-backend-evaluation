func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.urem %0, %arg1 : i64
  %2 = llvm.sdiv %0, %1 : i64
  %3 = llvm.urem %2, %arg2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

