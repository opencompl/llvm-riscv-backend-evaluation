func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i1 {
  %0 = llvm.or %arg0, %arg1 : i64
  %1 = llvm.select %arg2, %arg0, %arg0 : i1, i64
  %2 = llvm.ashr %arg1, %arg0 : i64
  %3 = llvm.select %arg2, %2, %2 : i1, i64
  %4 = llvm.lshr %1, %3 : i64
  %5 = llvm.icmp "ne" %0, %4 : i64
  return %5 : i1
}

