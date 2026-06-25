func.func @main(%arg0: i64, %arg1: i32) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.zext %arg1 : i32 to i64
  %3 = llvm.srem %arg0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.and %1, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

