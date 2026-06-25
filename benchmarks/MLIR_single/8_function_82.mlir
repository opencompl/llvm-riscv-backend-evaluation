func.func @main(%arg0: i64, %arg1: i64, %arg2: i1) -> i32 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.select %arg2, %arg1, %arg1 : i1, i64
  %2 = llvm.icmp "sgt" %0, %1 : i64
  %3 = llvm.or %arg1, %arg1 : i64
  %4 = llvm.select %2, %3, %0 : i1, i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

