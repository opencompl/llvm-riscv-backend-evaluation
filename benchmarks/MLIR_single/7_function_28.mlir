func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
  %0 = llvm.zext %arg2 : i32 to i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.srem %2, %2 : i64
  %4 = llvm.srem %arg1, %3 : i64
  %5 = llvm.udiv %arg0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

