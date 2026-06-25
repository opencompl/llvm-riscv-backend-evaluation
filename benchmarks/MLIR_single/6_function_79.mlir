func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i1 {
  %0 = llvm.srem %arg1, %arg2 : i64
  %1 = llvm.select %arg0, %0, %arg2 : i1, i64
  %2 = llvm.select %arg0, %arg2, %0 : i1, i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.icmp "slt" %1, %4 : i64
  return %5 : i1
}

