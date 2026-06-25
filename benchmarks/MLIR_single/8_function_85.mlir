func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.and %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.trunc %arg0 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.urem %3, %arg2 : i64
  %5 = llvm.select %1, %4, %4 : i1, i64
  %6 = llvm.udiv %arg2, %3 : i64
  %7 = llvm.icmp "sgt" %5, %6 : i64
  return %7 : i1
}

