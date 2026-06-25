func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) -> i64 {
  %0 = llvm.sdiv exact %arg0, %arg0 : i64
  %1 = llvm.ashr %0, %arg0 : i64
  %2 = llvm.xor %1, %arg1 : i64
  %3 = llvm.and %2, %arg2 : i64
  %4 = llvm.select %arg3, %1, %3 : i1, i64
  %5 = llvm.udiv %4, %0 : i64
  %6 = llvm.udiv %3, %5 : i64
  return %6 : i64
}

