func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.urem %arg1, %arg0 : i64
  %1 = llvm.sdiv %0, %arg2 : i64
  %2 = llvm.lshr exact %arg0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

