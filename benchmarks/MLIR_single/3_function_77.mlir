func.func @main(%arg0: i64) -> i1 {
  %0 = llvm.and %arg0, %arg0 : i64
  %1 = llvm.lshr %arg0, %arg0 : i64
  %2 = llvm.icmp "ule" %0, %1 : i64
  return %2 : i1
}

