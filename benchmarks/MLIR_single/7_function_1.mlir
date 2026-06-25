func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.zext %arg2 : i32 to i64
  %2 = llvm.sdiv %1, %arg0 : i64
  %3 = llvm.lshr exact %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

