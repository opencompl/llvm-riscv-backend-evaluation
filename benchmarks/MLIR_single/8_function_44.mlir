func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sdiv %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.urem %0, %0 : i64
  %4 = llvm.and %arg2, %3 : i64
  %5 = llvm.sdiv exact %arg1, %arg0 : i64
  %6 = llvm.or disjoint %4, %5 : i64
  %7 = llvm.icmp "sge" %2, %6 : i64
  return %7 : i1
}

