func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg1, %arg2 : i64
  %1 = llvm.trunc %arg0 : i64 to i1
  %2 = llvm.select %1, %arg2, %arg2 : i1, i64
  %3 = llvm.udiv %0, %2 : i64
  %4 = llvm.icmp "sge" %arg0, %3 : i64
  return %4 : i1
}

