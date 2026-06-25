func.func @main(%arg0: i64) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.icmp "eq" %arg0, %1 : i64
  return %2 : i1
}

