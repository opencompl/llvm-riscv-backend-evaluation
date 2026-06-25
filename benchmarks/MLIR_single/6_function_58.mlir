func.func @main(%arg0: i64, %arg1: i32) -> i32 {
  %0 = llvm.icmp "ugt" %arg0, %arg0 : i64
  %1 = llvm.zext %arg1 : i32 to i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.select %0, %arg0, %3 : i1, i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

