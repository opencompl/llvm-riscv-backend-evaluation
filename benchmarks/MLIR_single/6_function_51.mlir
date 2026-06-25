func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.trunc %arg1 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.urem %2, %arg2 : i64
  %4 = llvm.and %0, %3 : i64
  %5 = llvm.icmp "ult" %0, %4 : i64
  return %5 : i1
}

