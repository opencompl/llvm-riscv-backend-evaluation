func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.srem %arg1, %arg0 : i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  return %3 : i64
}

