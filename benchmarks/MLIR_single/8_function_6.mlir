func.func @main(%arg0: i32, %arg1: i64, %arg2: i64, %arg3: i1) -> i64 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.select %arg3, %arg2, %0 : i1, i64
  %2 = llvm.or %arg2, %1 : i64
  %3 = llvm.srem %2, %1 : i64
  %4 = llvm.xor %2, %3 : i64
  %5 = llvm.udiv %4, %2 : i64
  %6 = llvm.srem %arg1, %5 : i64
  %7 = llvm.ashr exact %0, %6 : i64
  return %7 : i64
}

