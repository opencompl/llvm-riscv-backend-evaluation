func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
  %0 = llvm.sdiv exact %arg0, %arg1 : i64
  %1 = llvm.zext %arg2 : i32 to i64
  %2 = llvm.lshr %1, %0 : i64
  %3 = llvm.sdiv %2, %1 : i64
  %4 = llvm.icmp "slt" %0, %3 : i64
  return %4 : i1
}

