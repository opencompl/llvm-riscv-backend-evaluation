func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i1 {
  %0 = llvm.icmp "eq" %arg2, %arg0 : i64
  %1 = llvm.sext %arg3 : i32 to i64
  %2 = llvm.select %0, %1, %arg0 : i1, i64
  %3 = llvm.urem %arg1, %2 : i64
  %4 = llvm.and %arg0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

