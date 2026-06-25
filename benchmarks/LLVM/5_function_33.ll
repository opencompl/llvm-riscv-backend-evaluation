"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i1, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.udiv"(%arg2, %arg2) : (i64, i64) -> i64
    %1 = "llvm.and"(%arg2, %0) : (i64, i64) -> i64
    %2 = "llvm.select"(%arg1, %arg0, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.and"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "llvm.return"(%4) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

