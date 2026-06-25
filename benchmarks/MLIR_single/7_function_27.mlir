func.func @main(%arg0: i64, %arg1: i1, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.xor %1, %1 : i64
  %3 = llvm.select %arg1, %2, %arg2 : i1, i64
  %4 = llvm.icmp "slt" %2, %3 : i64
  %5 = llvm.select %4, %arg0, %1 : i1, i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

