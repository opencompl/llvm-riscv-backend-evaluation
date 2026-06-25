"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i1, i1, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1, %arg1: i1, %arg2: i64):
    %0 = "llvm.srem"(%arg2, %arg2) : (i64, i64) -> i64
    %1 = "llvm.select"(%arg1, %0, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.srem"(%arg2, %1) : (i64, i64) -> i64
    %3 = "llvm.select"(%arg0, %1, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %5 = "llvm.select"(%4, %1, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "llvm.return"(%5) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

