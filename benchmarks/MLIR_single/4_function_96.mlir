func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i1 {
  %0 = llvm.zext %arg1 : i32 to i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.lshr %arg2, %arg2 : i64
  %3 = llvm.icmp "slt" %1, %2 : i64
  return %3 : i1
}

