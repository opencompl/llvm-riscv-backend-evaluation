func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.sdiv %arg1, %1 : i64
  %3 = llvm.sdiv %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

