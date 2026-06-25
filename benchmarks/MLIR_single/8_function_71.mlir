func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.or disjoint %arg0, %arg0 : i64
  %1 = llvm.icmp "sgt" %0, %arg1 : i64
  %2 = llvm.select %1, %0, %arg2 : i1, i64
  %3 = llvm.trunc %2 : i64 to i1
  %4 = llvm.trunc %2 : i64 to i1
  %5 = llvm.lshr %arg0, %2 : i64
  %6 = llvm.select %4, %arg2, %5 : i1, i64
  %7 = llvm.select %3, %2, %6 : i1, i64
  return %7 : i64
}

