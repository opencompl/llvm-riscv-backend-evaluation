"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.sdiv"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.xor"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.and"(%1, %1) : (i64, i64) -> i64
    "llvm.return"(%2) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

