func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.trunc %arg1 : i64 to i1
  %1 = llvm.select %0, %arg2, %arg2 : i1, i64
  %2 = llvm.icmp "ule" %arg0, %1 : i64
  return %2 : i1
}

