func.func @main(%arg0: i64, %arg1: i1) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.select %arg1, %1, %1 : i1, i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.icmp "sgt" %1, %4 : i64
  return %5 : i1
}

