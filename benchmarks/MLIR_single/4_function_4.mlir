func.func @main(%arg0: i64, %arg1: i64, %arg2: i32) -> i32 {
  %0 = llvm.or disjoint %arg0, %arg1 : i64
  %1 = llvm.zext %arg2 : i32 to i64
  %2 = llvm.xor %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  return %3 : i32
}

