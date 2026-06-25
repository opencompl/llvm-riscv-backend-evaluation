func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.lshr %arg0, %arg1 : i64
  %1 = llvm.trunc %arg0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.lshr %0, %2 : i64
  %4 = llvm.urem %3, %2 : i64
  %5 = llvm.icmp "ule" %3, %4 : i64
  return %5 : i1
}

