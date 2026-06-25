func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.urem %arg0, %arg0 : i64
  %1 = llvm.xor %arg1, %arg1 : i64
  %2 = llvm.or disjoint %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.srem %4, %arg0 : i64
  %6 = llvm.icmp "slt" %arg0, %5 : i64
  return %6 : i1
}

