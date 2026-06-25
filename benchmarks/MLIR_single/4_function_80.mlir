func.func @main(%arg0: i64) -> i32 {
  %0 = llvm.ashr exact %arg0, %arg0 : i64
  %1 = llvm.urem %arg0, %0 : i64
  %2 = llvm.and %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

