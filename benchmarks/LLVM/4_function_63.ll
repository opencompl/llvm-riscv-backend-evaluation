"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i1, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64):
    %0 = "llvm.select"(%arg0, %arg1, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.ashr"(%arg2, %arg2) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.srem"(%arg1, %1) : (i64, i64) -> i64
    %3 = "llvm.icmp"(%0, %2) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.return"(%3) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

