func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.or %arg0, %arg1 : i64
  %1 = llvm.ashr exact %arg2, %0 : i64
  %2 = llvm.sdiv exact %arg2, %1 : i64
  %3 = llvm.icmp "slt" %0, %2 : i64
  return %3 : i1
}

