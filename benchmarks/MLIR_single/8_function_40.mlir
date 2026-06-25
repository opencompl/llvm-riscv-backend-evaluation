func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.icmp "uge" %1, %1 : i64
  %3 = llvm.select %2, %arg0, %arg0 : i1, i64
  %4 = llvm.or %arg0, %3 : i64
  %5 = llvm.ashr exact %arg2, %arg2 : i64
  %6 = llvm.or disjoint %arg1, %5 : i64
  %7 = llvm.ashr %4, %6 : i64
  return %7 : i64
}

