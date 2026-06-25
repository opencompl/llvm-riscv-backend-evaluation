func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.xor %arg1, %0 : i64
  %2 = llvm.xor %0, %1 : i64
  %3 = llvm.or disjoint %arg2, %0 : i64
  %4 = llvm.icmp "ne" %2, %3 : i64
  return %4 : i1
}

