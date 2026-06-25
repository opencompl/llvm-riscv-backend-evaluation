func.func @main(%arg0: i32) -> i1 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.ashr exact %0, %0 : i64
  %2 = llvm.zext %arg0 : i32 to i64
  %3 = llvm.urem %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

