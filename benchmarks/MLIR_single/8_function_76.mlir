func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.sdiv %0, %arg1 : i64
  %2 = llvm.trunc %arg2 : i64 to i1
  %3 = llvm.select %2, %arg0, %arg2 : i1, i64
  %4 = llvm.srem %1, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.zext %5 : i32 to i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

