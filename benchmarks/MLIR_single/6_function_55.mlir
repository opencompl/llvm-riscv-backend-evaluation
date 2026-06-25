func.func @main(%arg0: i64, %arg1: i64) -> i1 {
  %0 = llvm.sdiv exact %arg0, %arg0 : i64
  %1 = llvm.urem %arg0, %arg1 : i64
  %2 = llvm.srem %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.trunc %4 : i64 to i1
  return %5 : i1
}

