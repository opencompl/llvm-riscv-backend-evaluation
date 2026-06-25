func.func @main(%arg0: i64) -> i64 {
  %0 = llvm.udiv %arg0, %arg0 : i64
  %1 = llvm.sdiv exact %arg0, %0 : i64
  %2 = llvm.udiv %1, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  return %4 : i64
}

