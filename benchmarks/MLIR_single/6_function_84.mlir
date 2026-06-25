func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i64 {
  %0 = llvm.lshr %arg1, %arg0 : i64
  %1 = llvm.sdiv exact %arg0, %0 : i64
  %2 = llvm.lshr exact %1, %arg2 : i64
  %3 = llvm.sext %arg3 : i32 to i64
  %4 = llvm.icmp "ule" %2, %3 : i64
  %5 = llvm.select %4, %2, %arg2 : i1, i64
  return %5 : i64
}

