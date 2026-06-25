func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i64 {
  %0 = llvm.urem %arg0, %arg0 : i64
  %1 = llvm.ashr %0, %arg1 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.select %arg2, %1, %arg0 : i1, i64
  %5 = llvm.urem %3, %4 : i64
  return %5 : i64
}

