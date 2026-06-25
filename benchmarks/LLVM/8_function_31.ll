"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg1, %arg0) : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.sext"(%2) : (i32) -> i64
    %4 = "llvm.lshr"(%1, %arg2) : (i64, i64) -> i64
    %5 = "llvm.icmp"(%3, %4) <{predicate = 6 : i64}> : (i64, i64) -> i1
    %6 = "llvm.srem"(%3, %0) : (i64, i64) -> i64
    %7 = "llvm.select"(%5, %arg2, %6) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "llvm.return"(%7) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

