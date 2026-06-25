func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.zext %0 : i32 to i64
  %3 = llvm.lshr %arg1, %2 : i64
  %4 = llvm.sdiv exact %1, %3 : i64
  return %4 : i64
}

