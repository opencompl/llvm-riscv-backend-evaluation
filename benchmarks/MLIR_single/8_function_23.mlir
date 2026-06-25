func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.udiv %1, %arg0 : i64
  %3 = llvm.sdiv %arg1, %1 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  %6 = llvm.srem %2, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

