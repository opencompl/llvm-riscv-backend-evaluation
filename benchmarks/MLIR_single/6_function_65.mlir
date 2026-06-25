func.func @main(%arg0: i64) -> i32 {
  %0 = llvm.lshr %arg0, %arg0 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.sext %1 : i32 to i64
  %4 = llvm.sdiv exact %2, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

