func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.and %arg1, %arg2 : i64
  %1 = llvm.icmp "sgt" %arg0, %0 : i64
  %2 = llvm.srem %arg1, %arg0 : i64
  %3 = llvm.select %1, %arg2, %2 : i1, i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

