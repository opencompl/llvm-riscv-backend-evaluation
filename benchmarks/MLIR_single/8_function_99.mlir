func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.icmp "ugt" %arg0, %arg0 : i64
  %1 = llvm.or disjoint %arg1, %arg2 : i64
  %2 = llvm.lshr exact %1, %arg0 : i64
  %3 = llvm.sdiv exact %1, %2 : i64
  %4 = llvm.select %0, %3, %arg2 : i1, i64
  %5 = llvm.xor %4, %arg0 : i64
  %6 = llvm.urem %5, %3 : i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

