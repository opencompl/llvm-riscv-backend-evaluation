"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i1, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.sdiv"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.and"(%arg0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.select"(%arg1, %0, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.urem"(%2, %arg2) : (i64, i64) -> i64
    %4 = "llvm.or"(%0, %3) : (i64, i64) -> i64
    "llvm.return"(%4) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

