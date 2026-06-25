func.func @main(%arg0: i1, %arg1: i64, %arg2: i32) -> i64 {
  %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
  %1 = llvm.zext %arg2 : i32 to i64
  %2 = llvm.icmp "eq" %0, %1 : i64
  %3 = llvm.select %2, %arg1, %0 : i1, i64
  return %3 : i64
}

