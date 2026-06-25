func.func @main(%arg0: i64, %arg1: i32) -> i1 {
  %0 = llvm.or %arg0, %arg0 : i64
  %1 = llvm.zext %arg1 : i32 to i64
  %2 = llvm.udiv %0, %1 : i64
  %3 = llvm.ashr exact %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

