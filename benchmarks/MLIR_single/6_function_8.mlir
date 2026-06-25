func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.udiv %arg2, %arg2 : i64
  %1 = llvm.select %arg0, %arg1, %0 : i1, i64
  %2 = llvm.lshr %1, %arg2 : i64
  %3 = llvm.sdiv exact %arg2, %0 : i64
  %4 = llvm.srem %3, %arg2 : i64
  %5 = llvm.icmp "slt" %2, %4 : i64
  return %5 : i1
}

