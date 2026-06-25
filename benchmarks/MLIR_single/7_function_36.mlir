func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.ashr exact %arg1, %arg2 : i64
  %1 = llvm.select %arg0, %0, %arg2 : i1, i64
  %2 = llvm.icmp "ule" %arg1, %0 : i64
  %3 = llvm.or %1, %1 : i64
  %4 = llvm.select %2, %3, %0 : i1, i64
  %5 = llvm.udiv %4, %3 : i64
  %6 = llvm.lshr exact %1, %5 : i64
  return %6 : i64
}

