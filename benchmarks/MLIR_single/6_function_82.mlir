func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.urem %arg2, %arg0 : i64
  %1 = llvm.icmp "ugt" %arg1, %0 : i64
  %2 = llvm.urem %arg2, %arg2 : i64
  %3 = llvm.select %1, %2, %arg2 : i1, i64
  %4 = llvm.udiv %arg0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

