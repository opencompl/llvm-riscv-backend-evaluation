"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.ashr"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.lshr"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%arg0, %arg0) : (i64, i64) -> i64
    %3 = "llvm.udiv"(%1, %2) : (i64, i64) -> i64
    "llvm.return"(%3) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

