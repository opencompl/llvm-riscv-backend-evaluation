"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i1, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg2, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.select"(%arg0, %arg1, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.icmp"(%1, %arg2) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "llvm.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

