func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.udiv %arg0, %arg0 : i64
  %3 = llvm.srem %0, %arg0 : i64
  %4 = llvm.xor %2, %3 : i64
  %5 = llvm.select %1, %arg2, %4 : i1, i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

