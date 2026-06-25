func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.or %arg1, %arg2 : i64
  %1 = llvm.or %arg2, %arg1 : i64
  %2 = llvm.sdiv exact %0, %1 : i64
  %3 = llvm.and %2, %arg1 : i64
  %4 = llvm.icmp "ugt" %arg0, %3 : i64
  return %4 : i1
}

