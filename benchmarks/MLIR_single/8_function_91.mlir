func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.or disjoint %arg0, %0 : i64
  %2 = llvm.xor %1, %arg0 : i64
  %3 = llvm.udiv %1, %2 : i64
  %4 = llvm.sdiv %3, %arg1 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  %7 = llvm.icmp "sgt" %6, %1 : i64
  return %7 : i1
}

