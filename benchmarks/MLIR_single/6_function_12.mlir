func.func @main(%arg0: i64, %arg1: i64) -> i32 {
  %0 = llvm.sdiv %arg0, %arg0 : i64
  %1 = llvm.and %arg1, %arg1 : i64
  %2 = llvm.ashr exact %0, %1 : i64
  %3 = llvm.urem %arg0, %2 : i64
  %4 = llvm.and %3, %arg1 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

