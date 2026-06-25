func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
  %1 = llvm.or %arg2, %0 : i64
  %2 = llvm.lshr %1, %arg1 : i64
  %3 = llvm.urem %1, %2 : i64
  %4 = llvm.srem %3, %3 : i64
  %5 = llvm.icmp "sge" %0, %4 : i64
  return %5 : i1
}

