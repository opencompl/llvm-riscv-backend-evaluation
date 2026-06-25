func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.icmp "eq" %arg1, %arg2 : i64
  %1 = llvm.select %0, %arg0, %arg0 : i1, i64
  %2 = llvm.xor %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

