func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.ashr exact %arg0, %arg0 : i64
  %2 = llvm.urem %0, %1 : i64
  %3 = llvm.zext %arg2 : i32 to i64
  %4 = llvm.icmp "ult" %2, %3 : i64
  return %4 : i1
}

