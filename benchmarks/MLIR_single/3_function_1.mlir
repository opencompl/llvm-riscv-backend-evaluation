func.func @main(%arg0: i32) -> i1 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.urem %0, %0 : i64
  %2 = llvm.trunc %1 : i64 to i1
  return %2 : i1
}

