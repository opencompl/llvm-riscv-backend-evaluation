func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i32 {
  %0 = llvm.urem %arg0, %arg0 : i64
  %1 = llvm.urem %0, %arg1 : i64
  %2 = llvm.select %arg2, %arg0, %0 : i1, i64
  %3 = llvm.xor %2, %1 : i64
  %4 = llvm.sdiv %3, %2 : i64
  %5 = llvm.xor %1, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

