func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.lshr %arg1, %arg2 : i64
  %1 = llvm.xor %arg0, %0 : i64
  %2 = llvm.srem %1, %arg0 : i64
  %3 = llvm.icmp "ule" %1, %2 : i64
  return %3 : i1
}

