func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.or %arg0, %arg0 : i64
  %1 = llvm.udiv %arg0, %0 : i64
  %2 = llvm.icmp "sgt" %1, %0 : i64
  %3 = llvm.ashr %0, %arg1 : i64
  %4 = llvm.select %2, %3, %arg2 : i1, i64
  %5 = llvm.and %arg0, %4 : i64
  %6 = llvm.ashr %5, %1 : i64
  return %6 : i64
}

