"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg0) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.icmp"(%0, %arg1) <{predicate = 4 : i64}> : (i64, i64) -> i1
    %2 = "llvm.select"(%1, %0, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %4 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %5 = "llvm.lshr"(%arg0, %2) : (i64, i64) -> i64
    %6 = "llvm.select"(%4, %arg2, %5) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %7 = "llvm.select"(%3, %2, %6) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "llvm.return"(%7) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

