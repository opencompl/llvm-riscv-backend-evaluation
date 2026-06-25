func.func @main(%arg0: i32, %arg1: i1, %arg2: i64) -> i32 {
  %0 = llvm.sext %arg0 : i32 to i64
  %1 = llvm.select %arg1, %arg2, %0 : i1, i64
  %2 = llvm.ashr exact %0, %1 : i64
  %3 = llvm.trunc %2 : i64 to i32
  %4 = llvm.sext %3 : i32 to i64
  %5 = llvm.urem %0, %arg2 : i64
  %6 = llvm.udiv %4, %5 : i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

