"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.udiv"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.and"(%0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.or"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.sext"(%3) : (i32) -> i64
    %5 = "llvm.icmp"(%2, %4) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.return"(%5) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

