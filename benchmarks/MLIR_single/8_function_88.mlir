func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.xor %arg0, %0 : i64
  %2 = llvm.xor %arg1, %arg2 : i64
  %3 = llvm.xor %0, %2 : i64
  %4 = llvm.sdiv %1, %3 : i64
  %5 = llvm.srem %4, %arg1 : i64
  %6 = llvm.xor %arg2, %arg0 : i64
  %7 = llvm.icmp "ugt" %5, %6 : i64
  return %7 : i1
}

