"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i64):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.zext"(%arg1) : (i32) -> i64
    %2 = "llvm.or"(%1, %arg2) <{isDisjoint}> : (i64, i64) -> i64
    %3 = "llvm.urem"(%0, %2) : (i64, i64) -> i64
    "llvm.return"(%3) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

