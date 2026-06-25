func.func @main(%arg0: i64) -> i64 {
  %0 = llvm.lshr %arg0, %arg0 : i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.select %1, %0, %arg0 : i1, i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  return %4 : i64
}

