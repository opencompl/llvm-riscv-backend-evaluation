func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg2 : i64
  %1 = llvm.lshr exact %0, %arg2 : i64
  %2 = llvm.select %arg1, %0, %1 : i1, i64
  %3 = llvm.and %1, %arg2 : i64
  %4 = llvm.or disjoint %2, %3 : i64
  %5 = llvm.icmp "ugt" %arg0, %4 : i64
  return %5 : i1
}

