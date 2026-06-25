"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.ashr"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.ashr"(%0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.ashr"(%arg0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.xor"(%0, %arg1) : (i64, i64) -> i64
    %5 = "llvm.xor"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%6) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

