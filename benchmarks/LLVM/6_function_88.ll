"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i1, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.select"(%arg1, %arg2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.or"(%0, %0) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.icmp"(%arg0, %1) <{predicate = 2 : i64}> : (i64, i64) -> i1
    %3 = "llvm.select"(%2, %1, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.srem"(%3, %arg0) : (i64, i64) -> i64
    %5 = "llvm.icmp"(%3, %4) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "llvm.return"(%5) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

