func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.or disjoint %arg0, %arg0 : i64
  %1 = llvm.lshr %0, %arg0 : i64
  %2 = llvm.trunc %arg1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.icmp "ule" %1, %3 : i64
  return %4 : i1
}

