func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.ashr %arg0, %arg1 : i64
  %1 = llvm.icmp "uge" %0, %arg2 : i64
  %2 = llvm.urem %arg2, %arg1 : i64
  %3 = llvm.select %1, %arg1, %2 : i1, i64
  %4 = llvm.udiv %arg1, %0 : i64
  %5 = llvm.ashr exact %3, %4 : i64
  %6 = llvm.udiv %3, %5 : i64
  %7 = llvm.icmp "ugt" %6, %3 : i64
  return %7 : i1
}

