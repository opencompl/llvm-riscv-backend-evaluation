"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.trunc"(%arg1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.sext"(%0) : (i32) -> i64
    %2 = "llvm.zext"(%0) : (i32) -> i64
    %3 = "llvm.sdiv"(%1, %2) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.ashr"(%3, %2) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.icmp"(%arg0, %4) <{predicate = 7 : i64}> : (i64, i64) -> i1
    "llvm.return"(%5) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

