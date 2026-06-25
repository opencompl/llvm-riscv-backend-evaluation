func.func @main(%arg0: i64, %arg1: i64, %arg2: i64) -> i32 {
  %0 = llvm.urem %arg0, %arg1 : i64
  %1 = llvm.ashr exact %0, %arg2 : i64
  %2 = llvm.trunc %1 : i64 to i32
  return %2 : i32
}

