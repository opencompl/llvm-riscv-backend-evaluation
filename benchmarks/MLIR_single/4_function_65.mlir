func.func @main(%arg0: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.urem %arg0, %0 : i64
  %2 = llvm.xor %1, %1 : i64
  %3 = llvm.icmp "ult" %1, %2 : i64
  return %3 : i1
}

