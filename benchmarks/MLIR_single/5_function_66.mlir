func.func @main(%arg0: i64, %arg1: i64) -> i64 {
  %0 = llvm.trunc %arg1 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.trunc %1 : i64 to i32
  %3 = llvm.zext %2 : i32 to i64
  %4 = llvm.urem %arg0, %3 : i64
  return %4 : i64
}

