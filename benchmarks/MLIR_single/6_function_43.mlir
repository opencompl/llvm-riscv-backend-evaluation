func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.select %arg0, %arg1, %arg2 : i1, i64
  %1 = llvm.srem %0, %arg1 : i64
  %2 = llvm.ashr exact %arg2, %arg1 : i64
  %3 = llvm.icmp "slt" %1, %2 : i64
  %4 = llvm.select %3, %2, %arg1 : i1, i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

