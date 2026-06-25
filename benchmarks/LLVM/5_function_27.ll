"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.and"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.icmp"(%arg0, %0) <{predicate = 4 : i64}> : (i64, i64) -> i1
    %2 = "llvm.srem"(%arg1, %arg0) : (i64, i64) -> i64
    %3 = "llvm.select"(%1, %arg2, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "llvm.return"(%4) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

