func.func @main(%arg0: i32, %arg1: i64) -> i1 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.and %0, %arg1 : i64
  %2 = llvm.trunc %1 : i64 to i1
  return %2 : i1
}

