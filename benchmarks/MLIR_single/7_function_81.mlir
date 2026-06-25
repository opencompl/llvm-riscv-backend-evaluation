func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.lshr exact %0, %arg1 : i64
  %2 = llvm.lshr exact %0, %1 : i64
  %3 = llvm.zext %arg0 : i32 to i64
  %4 = llvm.xor %arg2, %3 : i64
  %5 = llvm.srem %1, %4 : i64
  %6 = llvm.or disjoint %2, %5 : i64
  return %6 : i64
}

