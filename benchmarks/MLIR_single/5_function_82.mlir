func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.or disjoint %1, %arg0 : i64
  %3 = llvm.lshr exact %arg1, %arg2 : i64
  %4 = llvm.icmp "uge" %2, %3 : i64
  return %4 : i1
}

