func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.icmp "ugt" %arg0, %arg1 : i64
  %1 = llvm.select %0, %arg0, %arg2 : i1, i64
  %2 = llvm.trunc %1 : i64 to i32
  return %2 : i32
}

