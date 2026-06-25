func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.icmp "ugt" %arg0, %arg1 : i64
  %1 = llvm.select %0, %arg0, %arg0 : i1, i64
  %2 = llvm.udiv %arg0, %arg2 : i64
  %3 = llvm.sdiv %1, %2 : i64
  %4 = llvm.sdiv exact %3, %arg0 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.zext %5 : i32 to i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

