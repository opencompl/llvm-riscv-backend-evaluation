func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i1 {
  %0 = llvm.select %arg1, %arg2, %arg0 : i1, i64
  %1 = llvm.urem %0, %0 : i64
  %2 = llvm.udiv %arg0, %1 : i64
  %3 = llvm.ashr exact %0, %1 : i64
  %4 = llvm.xor %3, %arg2 : i64
  %5 = llvm.lshr exact %3, %4 : i64
  %6 = llvm.icmp "slt" %2, %5 : i64
  return %6 : i1
}

