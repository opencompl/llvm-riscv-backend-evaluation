func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.sdiv exact %arg0, %arg1 : i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.trunc %2 : i64 to i1
  return %3 : i1
}

