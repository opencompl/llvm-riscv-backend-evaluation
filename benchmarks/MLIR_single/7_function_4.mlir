func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sdiv %arg0, %arg1 : i64
  %1 = llvm.lshr exact %0, %0 : i64
  %2 = llvm.udiv %1, %arg1 : i64
  %3 = llvm.and %arg2, %2 : i64
  %4 = llvm.ashr %arg2, %3 : i64
  %5 = llvm.and %arg1, %4 : i64
  %6 = llvm.icmp "slt" %arg0, %5 : i64
  return %6 : i1
}

