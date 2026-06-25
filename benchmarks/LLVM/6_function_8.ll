"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i1, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64):
    %0 = "llvm.udiv"(%arg2, %arg2) : (i64, i64) -> i64
    %1 = "llvm.select"(%arg0, %arg1, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%arg2, %0) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.srem"(%3, %arg2) : (i64, i64) -> i64
    %5 = "llvm.icmp"(%2, %4) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.return"(%5) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

