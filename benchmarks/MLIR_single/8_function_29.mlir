func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) -> i32 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.srem %arg2, %arg0 : i64
  %2 = llvm.xor %0, %1 : i64
  %3 = llvm.xor %arg2, %arg1 : i64
  %4 = llvm.select %arg3, %0, %3 : i1, i64
  %5 = llvm.srem %2, %4 : i64
  %6 = llvm.lshr %5, %arg0 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

