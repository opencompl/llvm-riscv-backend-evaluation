func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg1, %arg0 : i64
  %1 = llvm.icmp "ule" %0, %arg2 : i64
  %2 = llvm.lshr %arg1, %arg2 : i64
  %3 = llvm.sdiv exact %0, %2 : i64
  %4 = llvm.select %1, %arg1, %3 : i1, i64
  %5 = llvm.urem %arg0, %4 : i64
  %6 = llvm.lshr exact %3, %4 : i64
  %7 = llvm.icmp "ule" %5, %6 : i64
  return %7 : i1
}

