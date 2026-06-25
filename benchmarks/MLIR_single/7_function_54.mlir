func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.trunc %arg2 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.lshr exact %arg1, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.urem %arg0, %4 : i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

