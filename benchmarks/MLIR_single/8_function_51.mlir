func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i32 {
  %0 = llvm.ashr %arg0, %arg1 : i64
  %1 = llvm.and %0, %0 : i64
  %2 = llvm.or disjoint %0, %1 : i64
  %3 = llvm.xor %arg2, %arg2 : i64
  %4 = llvm.zext %arg3 : i32 to i64
  %5 = llvm.lshr exact %3, %4 : i64
  %6 = llvm.sdiv exact %2, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

