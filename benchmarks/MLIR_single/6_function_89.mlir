func.func @main(%arg0: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.srem %arg0, %arg0 : i64
  %3 = llvm.and %1, %2 : i64
  %4 = llvm.udiv %3, %1 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

