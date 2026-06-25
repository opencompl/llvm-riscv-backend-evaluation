"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.and"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %2 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.zext"(%2) : (i32) -> i64
    %4 = "llvm.urem"(%3, %arg2) : (i64, i64) -> i64
    %5 = "llvm.select"(%1, %4, %4) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %6 = "llvm.udiv"(%arg2, %3) : (i64, i64) -> i64
    %7 = "llvm.icmp"(%5, %6) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "llvm.return"(%7) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

