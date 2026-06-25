func.func @main(%arg0: i64) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.and %arg0, %arg0 : i64
  %3 = llvm.icmp "ule" %1, %2 : i64
  return %3 : i1
}

