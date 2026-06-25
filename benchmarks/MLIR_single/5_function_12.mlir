func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.lshr exact %arg1, %arg1 : i64
  %1 = llvm.sdiv %arg0, %0 : i64
  %2 = llvm.icmp "sgt" %1, %arg2 : i64
  %3 = llvm.select %2, %arg1, %arg2 : i1, i64
  %4 = llvm.icmp "sle" %1, %3 : i64
  return %4 : i1
}

