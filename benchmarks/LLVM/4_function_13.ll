"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.sdiv"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.sext"(%1) : (i32) -> i64
    %3 = "llvm.icmp"(%arg0, %2) <{predicate = 8 : i64}> : (i64, i64) -> i1
    "llvm.return"(%3) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

