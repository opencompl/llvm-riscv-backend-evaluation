func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.or %arg0, %arg1 : i64
  %1 = llvm.or disjoint %0, %arg2 : i64
  %2 = llvm.urem %1, %0 : i64
  %3 = llvm.trunc %2 : i64 to i1
  %4 = llvm.select %3, %arg2, %2 : i1, i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  %7 = llvm.icmp "ugt" %6, %4 : i64
  return %7 : i1
}

