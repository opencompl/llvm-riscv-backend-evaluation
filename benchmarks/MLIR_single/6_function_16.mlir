func.func @main(%arg0: i1, %arg1: i64, %arg2: i32) -> i1 {
  %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
  %1 = llvm.sext %arg2 : i32 to i64
  %2 = llvm.lshr exact %0, %1 : i64
  %3 = llvm.urem %0, %0 : i64
  %4 = llvm.sdiv %3, %arg1 : i64
  %5 = llvm.icmp "eq" %2, %4 : i64
  return %5 : i1
}

