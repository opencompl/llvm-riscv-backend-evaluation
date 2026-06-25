func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.udiv %arg2, %arg1 : i64
  %1 = llvm.select %arg0, %arg1, %0 : i1, i64
  %2 = llvm.urem %1, %1 : i64
  %3 = llvm.srem %0, %2 : i64
  %4 = llvm.icmp "eq" %1, %3 : i64
  return %4 : i1
}

