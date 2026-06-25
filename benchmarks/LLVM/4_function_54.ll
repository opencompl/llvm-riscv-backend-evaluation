"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.urem"(%arg0, %arg2) : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.urem"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "llvm.return"(%3) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

