func.func @main(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) -> i1 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.zext %0 : i32 to i64
  %2 = llvm.ashr %arg1, %arg2 : i64
  %3 = llvm.xor %1, %2 : i64
  %4 = llvm.select %arg3, %arg0, %1 : i1, i64
  %5 = llvm.xor %3, %4 : i64
  %6 = llvm.trunc %5 : i64 to i1
  return %6 : i1
}

