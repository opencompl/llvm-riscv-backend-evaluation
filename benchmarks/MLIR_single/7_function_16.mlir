func.func @main(%arg0: i1, %arg1: i64, %arg2: i64, %arg3: i32) -> i32 {
  %0 = llvm.select %arg0, %arg1, %arg1 : i1, i64
  %1 = llvm.sdiv %0, %arg2 : i64
  %2 = llvm.zext %arg3 : i32 to i64
  %3 = llvm.ashr %1, %2 : i64
  %4 = llvm.trunc %3 : i64 to i32
  %5 = llvm.sext %4 : i32 to i64
  %6 = llvm.trunc %5 : i64 to i32
  return %6 : i32
}

