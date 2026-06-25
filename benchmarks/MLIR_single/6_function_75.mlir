func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i64 {
  %0 = llvm.ashr exact %arg0, %arg1 : i64
  %1 = llvm.lshr exact %arg0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.sext %2 : i32 to i64
  %4 = llvm.sext %arg2 : i32 to i64
  %5 = llvm.ashr exact %3, %4 : i64
  return %5 : i64
}

