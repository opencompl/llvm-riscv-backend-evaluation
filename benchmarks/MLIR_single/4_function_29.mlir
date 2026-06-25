func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sdiv exact %arg1, %arg2 : i64
  %1 = llvm.srem %arg0, %0 : i64
  %2 = llvm.xor %1, %arg0 : i64
  %3 = llvm.icmp "slt" %1, %2 : i64
  return %3 : i1
}

