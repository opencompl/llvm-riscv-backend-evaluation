func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.icmp "sle" %arg0, %arg0 : i64
  %1 = llvm.xor %arg0, %arg0 : i64
  %2 = llvm.urem %1, %1 : i64
  %3 = llvm.and %1, %arg1 : i64
  %4 = llvm.select %0, %2, %3 : i1, i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

