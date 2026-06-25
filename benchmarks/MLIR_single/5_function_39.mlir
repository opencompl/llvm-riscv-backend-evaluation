func.func @main(%arg0: i32) -> i1 {
  %0 = llvm.zext %arg0 : i32 to i64
  %1 = llvm.trunc %0 : i64 to i1
  %2 = llvm.xor %0, %0 : i64
  %3 = llvm.select %1, %0, %2 : i1, i64
  %4 = llvm.trunc %3 : i64 to i1
  return %4 : i1
}

