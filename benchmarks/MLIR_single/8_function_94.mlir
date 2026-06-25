func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32) -> i64 {
  %0 = llvm.sdiv exact %arg0, %arg1 : i64
  %1 = llvm.icmp "sgt" %0, %arg1 : i64
  %2 = llvm.ashr exact %arg2, %0 : i64
  %3 = llvm.sext %arg3 : i32 to i64
  %4 = llvm.srem %2, %3 : i64
  %5 = llvm.select %1, %0, %4 : i1, i64
  %6 = llvm.srem %arg2, %3 : i64
  %7 = llvm.ashr exact %5, %6 : i64
  return %7 : i64
}

