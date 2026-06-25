func.func @main(%arg0: i32, %arg1: i64) -> i64 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.srem %arg1, %arg1 : i64
  %2 = llvm.or %0, %1 : i64
  %3 = llvm.sdiv %0, %2 : i64
  return %3 : i64
}

