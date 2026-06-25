"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i1, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.lshr"(%arg0, %arg2) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.select"(%arg1, %arg2, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.udiv"(%1, %0) : (i64, i64) -> i64
    %3 = "llvm.srem"(%arg0, %2) : (i64, i64) -> i64
    "llvm.return"(%3) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

