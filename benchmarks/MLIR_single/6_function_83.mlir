func.func @main(%arg0: i32, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.icmp "sgt" %0, %arg1 : i64
  %2 = llvm.ashr exact %arg1, %arg1 : i64
  %3 = llvm.srem %2, %arg2 : i64
  %4 = llvm.select %1, %arg1, %3 : i1, i64
  %5 = llvm.ashr exact %4, %4 : i64
  return %5 : i64
}

