func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.lshr %arg1, %arg0 : i64
  %1 = llvm.sdiv exact %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  return %2 : i32
}

