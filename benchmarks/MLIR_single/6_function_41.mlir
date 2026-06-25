func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
  %0 = llvm.select %arg1, %arg0, %arg2 : i1, i64
  %1 = llvm.udiv %arg0, %0 : i64
  %2 = llvm.urem %arg2, %arg2 : i64
  %3 = llvm.srem %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  return %5 : i64
}

