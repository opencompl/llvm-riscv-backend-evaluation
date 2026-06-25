func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.icmp "eq" %arg0, %arg1 : i64
  %1 = llvm.udiv %arg2, %arg1 : i64
  %2 = llvm.select %0, %arg2, %1 : i1, i64
  %3 = llvm.or %arg0, %arg2 : i64
  %4 = llvm.icmp "ult" %arg1, %3 : i64
  %5 = llvm.select %4, %2, %arg0 : i1, i64
  %6 = llvm.ashr exact %2, %5 : i64
  return %6 : i64
}

