func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.xor %arg0, %arg1 : i64
  %2 = llvm.lshr exact %1, %arg2 : i64
  %3 = llvm.icmp "sgt" %0, %2 : i64
  return %3 : i1
}

