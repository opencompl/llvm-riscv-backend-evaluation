func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.trunc %arg1 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.ashr exact %1, %arg2 : i64
  %3 = llvm.select %arg0, %2, %arg1 : i1, i64
  return %3 : i64
}

