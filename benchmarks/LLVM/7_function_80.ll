"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.icmp"(%arg0, %arg1) <{predicate = 0 : i64}> : (i64, i64) -> i1
    %1 = "llvm.udiv"(%arg2, %arg1) : (i64, i64) -> i64
    %2 = "llvm.select"(%0, %arg2, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.or"(%arg0, %arg2) : (i64, i64) -> i64
    %4 = "llvm.icmp"(%arg1, %3) <{predicate = 6 : i64}> : (i64, i64) -> i1
    %5 = "llvm.select"(%4, %2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %6 = "llvm.ashr"(%2, %5) <{isExact}> : (i64, i64) -> i64
    "llvm.return"(%6) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

