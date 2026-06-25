func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sdiv %arg1, %arg2 : i64
  %1 = llvm.and %0, %arg1 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.ashr exact %arg0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

