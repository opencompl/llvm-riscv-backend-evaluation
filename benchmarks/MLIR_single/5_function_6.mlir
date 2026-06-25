func.func @main(%arg0: i64, %arg1: i1) -> i1 {
  %0 = llvm.srem %arg0, %arg0 : i64
  %1 = llvm.select %arg1, %0, %0 : i1, i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.icmp "eq" %arg0, %3 : i64
  return %4 : i1
}

