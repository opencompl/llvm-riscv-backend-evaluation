"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.ashr"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.or"(%arg1, %0) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.udiv"(%0, %1) : (i64, i64) -> i64
    "llvm.return"(%2) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

