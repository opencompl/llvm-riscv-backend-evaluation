func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.icmp "sge" %arg0, %arg1 : i64
  %1 = llvm.select %0, %arg2, %arg2 : i1, i64
  %2 = llvm.urem %1, %arg1 : i64
  %3 = llvm.select %0, %arg2, %2 : i1, i64
  %4 = llvm.icmp "sge" %3, %arg0 : i64
  return %4 : i1
}

