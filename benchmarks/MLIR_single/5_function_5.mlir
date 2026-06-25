func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.udiv %0, %arg2 : i64
  %2 = llvm.udiv %1, %arg0 : i64
  %3 = llvm.udiv %2, %1 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

