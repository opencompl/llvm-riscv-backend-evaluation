func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.trunc %arg1 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.sdiv exact %0, %arg2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  %6 = llvm.srem %2, %5 : i64
  %7 = llvm.and %0, %6 : i64
  return %7 : i64
}

