func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.ashr exact %arg1, %arg2 : i64
  %1 = llvm.or %arg1, %0 : i64
  %2 = llvm.sdiv exact %0, %1 : i64
  %3 = llvm.urem %arg0, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  return %4 : i32
}

