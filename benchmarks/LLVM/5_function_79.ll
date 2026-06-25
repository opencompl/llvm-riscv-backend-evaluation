"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.or"(%arg0, %arg0) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.lshr"(%0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%arg1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.sext"(%2) : (i32) -> i64
    %4 = "llvm.icmp"(%1, %3) <{predicate = 7 : i64}> : (i64, i64) -> i1
    "llvm.return"(%4) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

