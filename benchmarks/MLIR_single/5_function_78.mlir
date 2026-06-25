func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
  %0 = llvm.sdiv %arg0, %arg0 : i64
  %1 = llvm.lshr exact %0, %arg1 : i64
  %2 = llvm.zext %arg2 : i32 to i64
  %3 = llvm.srem %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

