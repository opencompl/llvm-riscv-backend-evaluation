func.func @main(%arg0: i1, %arg1: i64, %arg2: i64, %arg3: i32) -> i32 {
  %0 = llvm.urem %arg1, %arg2 : i64
  %1 = llvm.zext %arg3 : i32 to i64
  %2 = llvm.urem %1, %1 : i64
  %3 = llvm.xor %arg1, %2 : i64
  %4 = llvm.srem %3, %0 : i64
  %5 = llvm.sdiv exact %arg1, %4 : i64
  %6 = llvm.select %arg0, %0, %5 : i1, i64
  %7 = llvm.trunc %6 : i64 to i32
  return %7 : i32
}

