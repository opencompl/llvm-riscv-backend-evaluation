func.func @main(%arg0: i64, %arg1: i64, %arg2: i32, %arg3: i1) -> i1 {
  %0 = llvm.sext %arg2 : i32 to i64
  %1 = llvm.ashr exact %arg1, %0 : i64
  %2 = llvm.udiv %arg0, %1 : i64
  %3 = llvm.urem %2, %arg0 : i64
  %4 = llvm.select %arg3, %arg1, %arg0 : i1, i64
  %5 = llvm.lshr exact %4, %3 : i64
  %6 = llvm.urem %3, %5 : i64
  %7 = llvm.icmp "ule" %2, %6 : i64
  return %7 : i1
}

