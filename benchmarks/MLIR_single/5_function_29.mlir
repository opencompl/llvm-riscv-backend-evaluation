func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.sdiv exact %0, %arg2 : i64
  %2 = llvm.trunc %arg1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.srem %1, %3 : i64
  return %4 : i64
}

