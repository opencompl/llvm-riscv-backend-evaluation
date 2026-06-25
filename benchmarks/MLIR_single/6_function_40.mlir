func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.urem %arg0, %arg0 : i64
  %1 = llvm.udiv %0, %arg1 : i64
  %2 = llvm.srem %0, %1 : i64
  %3 = llvm.xor %2, %arg2 : i64
  %4 = llvm.udiv %0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

