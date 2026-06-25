func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.ashr exact %1, %arg1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.trunc %4 : i64 to i32
  %6 = llvm.zext %5 : i32 to i64
  %7 = llvm.urem %arg0, %6 : i64
  return %7 : i64
}

