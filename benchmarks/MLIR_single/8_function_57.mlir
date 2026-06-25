func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.icmp "slt" %arg1, %arg2 : i64
  %3 = llvm.select %2, %0, %0 : i1, i64
  %4 = llvm.icmp "ugt" %3, %1 : i64
  %5 = llvm.select %4, %arg0, %3 : i1, i64
  %6 = llvm.or %3, %5 : i64
  %7 = llvm.icmp "sgt" %1, %6 : i64
  return %7 : i1
}

