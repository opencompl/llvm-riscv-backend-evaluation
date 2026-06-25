func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.urem %arg1, %arg2 : i64
  %2 = llvm.and %0, %1 : i64
  %3 = llvm.icmp "ule" %2, %1 : i64
  return %3 : i1
}

