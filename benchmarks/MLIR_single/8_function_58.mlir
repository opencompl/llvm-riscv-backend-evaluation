func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.sdiv %arg1, %arg0 : i64
  %1 = llvm.and %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.urem %0, %1 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.zext %5 : i32 to i64
  %7 = llvm.icmp "slt" %3, %6 : i64
  return %7 : i1
}

