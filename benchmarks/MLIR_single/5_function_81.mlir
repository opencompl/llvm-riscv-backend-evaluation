func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.trunc %arg2 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.and %0, %2 : i64
  %4 = llvm.icmp "ule" %3, %0 : i64
  return %4 : i1
}

