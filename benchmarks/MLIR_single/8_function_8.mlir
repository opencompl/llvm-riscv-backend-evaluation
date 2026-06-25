func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i1 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.xor %1, %arg2 : i64
  %3 = llvm.and %arg1, %arg1 : i64
  %4 = llvm.zext %arg3 : i32 to i64
  %5 = llvm.and %4, %arg0 : i64
  %6 = llvm.or %3, %5 : i64
  %7 = llvm.icmp "eq" %2, %6 : i64
  return %7 : i1
}

