func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.udiv %arg1, %arg2 : i64
  %1 = llvm.and %arg1, %0 : i64
  %2 = llvm.icmp "sle" %arg0, %1 : i64
  return %2 : i1
}

