func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg1 : i64
  %1 = llvm.or %arg0, %0 : i64
  %2 = llvm.icmp "sle" %arg0, %1 : i64
  return %2 : i1
}

