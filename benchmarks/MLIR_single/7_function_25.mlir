func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i64 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.select %1, %arg2, %0 : i1, i64
  %3 = llvm.trunc %2 : i64 to i1
  %4 = llvm.zext %arg3 : i32 to i64
  %5 = llvm.urem %2, %0 : i64
  %6 = llvm.select %3, %4, %5 : i1, i64
  return %6 : i64
}

