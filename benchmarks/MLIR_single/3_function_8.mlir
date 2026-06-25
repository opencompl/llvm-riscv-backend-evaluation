func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.xor %arg1, %arg2 : i64
  %2 = llvm.icmp "sge" %0, %1 : i64
  return %2 : i1
}

