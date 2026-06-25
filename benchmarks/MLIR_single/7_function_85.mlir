func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
  %1 = llvm.xor %0, %arg2 : i64
  %2 = llvm.xor %1, %1 : i64
  %3 = llvm.and %0, %2 : i64
  %4 = llvm.xor %0, %arg2 : i64
  %5 = llvm.urem %3, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

