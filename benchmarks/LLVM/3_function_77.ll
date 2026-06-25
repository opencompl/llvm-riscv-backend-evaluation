"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.and"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%arg0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.icmp"(%0, %1) <{predicate = 7 : i64}> : (i64, i64) -> i1
    "llvm.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

