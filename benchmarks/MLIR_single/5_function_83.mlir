func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
  %0 = llvm.or %arg0, %arg1 : i64
  %1 = llvm.sext %arg2 : i32 to i64
  %2 = llvm.ashr %0, %1 : i64
  %3 = llvm.sdiv exact %arg0, %2 : i64
  %4 = llvm.icmp "sge" %2, %3 : i64
  return %4 : i1
}

