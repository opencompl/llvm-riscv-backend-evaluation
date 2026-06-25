func.func @main(%arg0: i64) -> i64 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.lshr exact %arg0, %0 : i64
  %2 = llvm.or %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.srem %2, %0 : i64
  %6 = llvm.urem %4, %5 : i64
  return %6 : i64
}

