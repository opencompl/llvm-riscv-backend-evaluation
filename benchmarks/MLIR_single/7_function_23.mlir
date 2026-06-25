func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.ashr exact %arg0, %arg0 : i64
  %1 = llvm.and %arg1, %arg2 : i64
  %2 = llvm.sdiv exact %arg0, %1 : i64
  %3 = llvm.udiv %0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

