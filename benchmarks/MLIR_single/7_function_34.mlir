func.func @main(%arg0: i1, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.trunc %arg2 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.xor %1, %arg2 : i64
  %3 = llvm.select %arg0, %arg1, %2 : i1, i64
  %4 = llvm.lshr exact %3, %1 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.sext %5 : i32 to i64
  return %6 : i64
}

