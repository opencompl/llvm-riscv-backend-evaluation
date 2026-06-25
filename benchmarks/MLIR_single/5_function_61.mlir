func.func @main(%arg0: i32, %arg1: i32) -> i32 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.zext %arg1 : i32 to i64
  %2 = llvm.sdiv exact %1, %0 : i64
  %3 = llvm.lshr %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

