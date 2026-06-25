func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sdiv exact %arg1, %arg1 : i64
  %1 = llvm.udiv %arg2, %0 : i64
  %2 = llvm.ashr exact %arg1, %1 : i64
  %3 = llvm.icmp "sgt" %arg0, %2 : i64
  return %3 : i1
}

