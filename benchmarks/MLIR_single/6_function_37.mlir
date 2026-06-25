func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.sdiv exact %0, %arg2 : i64
  %2 = llvm.urem %arg0, %arg0 : i64
  %3 = llvm.sdiv %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.zext %4 : i32 to i64
  return %5 : i64
}

