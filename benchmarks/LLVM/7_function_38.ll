"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.udiv"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.and"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.urem"(%1, %0) : (i64, i64) -> i64
    %3 = "llvm.icmp"(%2, %arg2) <{predicate = 0 : i64}> : (i64, i64) -> i1
    %4 = "llvm.select"(%3, %0, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.or"(%4, %arg1) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%6) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

