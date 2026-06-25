"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.icmp"(%1, %0) <{predicate = 4 : i64}> : (i64, i64) -> i1
    %3 = "llvm.ashr"(%0, %arg1) : (i64, i64) -> i64
    %4 = "llvm.select"(%2, %3, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.and"(%arg0, %4) : (i64, i64) -> i64
    %6 = "llvm.ashr"(%5, %1) : (i64, i64) -> i64
    "llvm.return"(%6) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

