func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.urem %arg0, %arg0 : i64
  %1 = llvm.icmp "sge" %0, %arg1 : i64
  %2 = llvm.urem %arg2, %arg1 : i64
  %3 = llvm.srem %0, %2 : i64
  %4 = llvm.select %1, %arg0, %3 : i1, i64
  %5 = llvm.sdiv exact %0, %4 : i64
  %6 = llvm.lshr exact %arg0, %5 : i64
  return %6 : i64
}

