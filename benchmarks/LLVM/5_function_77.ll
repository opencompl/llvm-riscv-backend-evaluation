"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.lshr"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.and"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.zext"(%3) : (i32) -> i64
    "llvm.return"(%4) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

