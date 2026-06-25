func.func @main(%arg0: i64, %arg1: i32) -> i1 {
  %0 = llvm.sext %arg1 : i32 to i64
  %1 = llvm.or disjoint %arg0, %0 : i64
  %2 = llvm.urem %arg0, %1 : i64
  %3 = llvm.icmp "ule" %2, %2 : i64
  return %3 : i1
}

