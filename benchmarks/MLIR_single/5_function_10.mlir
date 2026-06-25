func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.lshr exact %1, %arg1 : i64
  %3 = llvm.srem %2, %arg0 : i64
  %4 = llvm.urem %1, %3 : i64
  return %4 : i64
}

