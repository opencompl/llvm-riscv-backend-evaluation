func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.xor %arg0, %arg1 : i64
  %1 = llvm.and %arg2, %arg1 : i64
  %2 = llvm.urem %1, %arg1 : i64
  %3 = llvm.srem %0, %2 : i64
  %4 = llvm.srem %3, %2 : i64
  %5 = llvm.and %2, %4 : i64
  %6 = llvm.icmp "sge" %3, %5 : i64
  return %6 : i1
}

