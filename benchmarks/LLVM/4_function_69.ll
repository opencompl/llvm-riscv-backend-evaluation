"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i1, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1, %arg1: i64):
    %0 = "llvm.urem"(%arg1, %arg1) : (i64, i64) -> i64
    %1 = "llvm.ashr"(%arg1, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.select"(%arg0, %2, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "llvm.return"(%3) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

