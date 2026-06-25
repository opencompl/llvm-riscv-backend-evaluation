"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.icmp"(%arg0, %arg0) <{predicate = 1 : i64}> : (i64, i64) -> i1
    %1 = "llvm.select"(%0, %arg0, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.icmp"(%1, %arg0) <{predicate = 3 : i64}> : (i64, i64) -> i1
    "llvm.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

