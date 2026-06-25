func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i1 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.ashr exact %arg0, %0 : i64
  %2 = llvm.srem %arg0, %1 : i64
  %3 = llvm.srem %2, %arg2 : i64
  %4 = llvm.sext %arg3 : i32 to i64
  %5 = llvm.urem %4, %4 : i64
  %6 = llvm.icmp "ne" %3, %5 : i64
  return %6 : i1
}

