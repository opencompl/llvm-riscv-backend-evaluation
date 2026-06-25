func.func @main(%arg0: i32) -> i32 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.trunc %0 : i64 to i32
  %2 = llvm.zext %1 : i32 to i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

