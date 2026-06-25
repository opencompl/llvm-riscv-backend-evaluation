func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sdiv %arg1, %arg2 : i64
  %1 = llvm.ashr exact %arg0, %0 : i64
  %2 = llvm.icmp "ne" %1, %arg1 : i64
  return %2 : i1
}

