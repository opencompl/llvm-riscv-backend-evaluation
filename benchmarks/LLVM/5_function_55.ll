"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.icmp"(%arg0, %arg1) <{predicate = 5 : i64}> : (i64, i64) -> i1
    %1 = "llvm.select"(%0, %arg2, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.urem"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.select"(%0, %arg2, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.icmp"(%3, %arg0) <{predicate = 5 : i64}> : (i64, i64) -> i1
    "llvm.return"(%4) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

