func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
  %1 = llvm.ashr exact %arg2, %arg2 : i64
  %2 = llvm.srem %arg1, %1 : i64
  %3 = llvm.icmp "ne" %0, %2 : i64
  return %3 : i1
}

