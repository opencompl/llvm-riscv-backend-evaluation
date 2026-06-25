func.func @main(%arg0: i64) -> i1 {
  %0 = llvm.icmp "ne" %arg0, %arg0 : i64
  %1 = llvm.select %0, %arg0, %arg0 : i1, i64
  %2 = llvm.icmp "sle" %1, %arg0 : i64
  return %2 : i1
}

