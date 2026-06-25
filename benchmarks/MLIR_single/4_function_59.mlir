func.func @main(%arg0: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.ashr exact %1, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

