func.func @main(%arg0: i64, %arg1: i1, %arg2: i64, %arg3: i32) -> i64 {
  %0 = llvm.xor %arg2, %arg2 : i64
  %1 = llvm.zext %arg3 : i32 to i64
  %2 = llvm.select %arg1, %0, %1 : i1, i64
  %3 = llvm.ashr exact %arg0, %2 : i64
  return %3 : i64
}

