"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg1, %arg2) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.or"(%arg0, %0) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.ashr"(%arg1, %0) : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%1, %2) : (i64, i64) -> i64
    "llvm.return"(%3) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

