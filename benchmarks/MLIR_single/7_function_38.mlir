func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.urem %1, %0 : i64
  %3 = llvm.icmp "eq" %2, %arg2 : i64
  %4 = llvm.select %3, %0, %1 : i1, i64
  %5 = llvm.or %4, %arg1 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

