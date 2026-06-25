func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i32 {
  %0 = llvm.icmp "eq" %arg0, %arg0 : i64
  %1 = llvm.srem %arg1, %arg2 : i64
  %2 = llvm.zext %arg3 : i32 to i64
  %3 = llvm.sdiv exact %2, %arg1 : i64
  %4 = llvm.select %0, %1, %3 : i1, i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

