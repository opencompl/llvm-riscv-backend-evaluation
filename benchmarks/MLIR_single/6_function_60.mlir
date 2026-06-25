func.func @main(%arg0: i64) -> i1 {
  %0 = llvm.sdiv exact %arg0, %arg0 : i64
  %1 = llvm.trunc %arg0 : i64 to i32
  %2 = llvm.sext %1 : i32 to i64
  %3 = llvm.sdiv exact %0, %2 : i64
  %4 = llvm.lshr exact %arg0, %3 : i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

