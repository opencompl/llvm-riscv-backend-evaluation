func.func @main(%arg0: i64, %arg1: i32, %arg2: i64) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i1
  %1 = llvm.zext %arg1 : i32 to i64
  %2 = llvm.select %0, %1, %arg2 : i1, i64
  %3 = llvm.zext %arg1 : i32 to i64
  %4 = llvm.ashr exact %2, %3 : i64
  %5 = llvm.trunc %arg2 : i64 to i32
  %6 = llvm.zext %5 : i32 to i64
  %7 = llvm.icmp "uge" %4, %6 : i64
  return %7 : i1
}

