func.func @main(%arg0: i32) -> i1 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.select %1, %0, %0 : i1, i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.icmp "uge" %0, %4 : i64
  return %5 : i1
}

