func.func @main(%arg0: i32, %arg1: i64) -> i1 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.sdiv %0, %0 : i64
  %2 = llvm.icmp "sge" %1, %arg1 : i64
  return %2 : i1
}

