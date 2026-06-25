func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.icmp "sge" %arg0, %arg0 : i64
  %1 = llvm.ashr exact %arg0, %arg0 : i64
  %2 = llvm.urem %arg0, %arg2 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.ashr exact %arg1, %4 : i64
  %6 = llvm.select %0, %1, %5 : i1, i64
  return %6 : i64
}

