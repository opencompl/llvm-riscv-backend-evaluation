func.func @main(%arg0: i64, %arg1: i1, %arg2: i32) -> i1 {
  %0 = llvm.sext %arg2 : i32 to i64
  %1 = llvm.select %arg1, %0, %arg0 : i1, i64
  %2 = llvm.urem %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i1
  return %3 : i1
}

