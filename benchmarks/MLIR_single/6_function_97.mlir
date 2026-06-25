func.func @main(%arg0: i64) -> i32 {
  %0 = llvm.trunc %arg0 : i64 to i32
  %1 = llvm.sext %0 : i32 to i64
  %2 = llvm.trunc %1 : i64 to i1
  %3 = llvm.select %2, %1, %1 : i1, i64
  %4 = llvm.and %1, %3 : i64
  %5 = llvm.trunc %4 : i64 to i32
  return %5 : i32
}

