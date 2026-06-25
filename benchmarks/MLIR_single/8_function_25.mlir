func.func @main(%arg0: i64, %arg1: i1, %arg2: i64, %arg3: i32) -> i1 {
  %0 = llvm.select %arg1, %arg0, %arg2 : i1, i64
  %1 = llvm.sdiv exact %arg0, %0 : i64
  %2 = llvm.sext %arg3 : i32 to i64
  %3 = llvm.lshr exact %1, %2 : i64
  %4 = llvm.lshr exact %3, %2 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  %7 = llvm.trunc %6 : i64 to i1
  return %7 : i1
}

