func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i64 {
  %0 = llvm.lshr exact %arg1, %arg2 : i64
  %1 = llvm.icmp "sge" %arg0, %0 : i64
  %2 = llvm.zext %arg3 : i32 to i64
  %3 = llvm.select %1, %arg0, %2 : i1, i64
  %4 = llvm.xor %3, %arg1 : i64
  return %4 : i64
}

