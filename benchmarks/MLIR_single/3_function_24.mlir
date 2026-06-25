func.func @main(%arg0: i1, %arg1: i64) -> i64 {
  %0 = llvm.trunc %arg1 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.select %arg0, %arg1, %1 : i1, i64
  return %2 : i64
}

