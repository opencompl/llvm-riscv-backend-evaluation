"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %2 = "llvm.select"(%1, %arg2, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.udiv"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.icmp"(%arg0, %3) <{predicate = 5 : i64}> : (i64, i64) -> i1
    "llvm.return"(%4) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

