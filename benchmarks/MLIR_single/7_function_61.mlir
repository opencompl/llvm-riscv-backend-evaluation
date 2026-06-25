func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i1 {
  %0 = llvm.udiv %arg0, %arg1 : i64
  %1 = llvm.icmp "sgt" %0, %arg1 : i64
  %2 = llvm.zext %arg2 : i32 to i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.select %1, %4, %arg1 : i1, i64
  %6 = llvm.icmp "uge" %5, %4 : i64
  return %6 : i1
}

