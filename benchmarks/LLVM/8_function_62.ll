"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i32, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.udiv"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.xor"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %5 = "llvm.sext"(%4) : (i32) -> i64
    %6 = "llvm.ashr"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.and"(%6, %arg2) : (i64, i64) -> i64
    "llvm.return"(%7) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

