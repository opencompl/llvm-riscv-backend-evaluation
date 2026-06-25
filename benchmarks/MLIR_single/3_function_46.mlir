func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.ashr %arg0, %arg1 : i64
  %1 = llvm.sdiv %arg2, %0 : i64
  %2 = llvm.icmp "eq" %0, %1 : i64
  return %2 : i1
}

