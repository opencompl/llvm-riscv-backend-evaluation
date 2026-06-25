func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.sdiv %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.urem %arg0, %2 : i64
  %4 = llvm.lshr exact %arg0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.zext %5 : i32 to i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

