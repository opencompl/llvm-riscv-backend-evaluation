func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.icmp "sge" %arg0, %arg1 : i64
  %1 = llvm.select %0, %arg2, %arg0 : i1, i64
  %2 = llvm.ashr exact %arg2, %1 : i64
  %3 = llvm.and %arg0, %2 : i64
  %4 = llvm.xor %1, %3 : i64
  %5 = llvm.urem %1, %4 : i64
  %6 = llvm.select %0, %3, %5 : i1, i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

