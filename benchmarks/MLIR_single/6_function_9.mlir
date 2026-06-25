func.func @main(%arg0: i1, %arg1: i64, %arg2: i1, %arg3: i32) -> i32 {
  %0 = llvm.sext %arg3 : i32 to i64
  %1 = llvm.select %arg2, %0, %0 : i1, i64
  %2 = llvm.select %arg0, %arg1, %1 : i1, i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.zext %3 : i32 to i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

