func.func @main(%arg0: i32, %arg1: i32) -> i64 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.srem %0, %0 : i64
  %2 = llvm.sext %arg1 : i32 to i64
  %3 = llvm.urem %1, %2 : i64
  return %3 : i64
}

