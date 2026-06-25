"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.icmp"(%0, %arg2) <{predicate = 9 : i64}> : (i64, i64) -> i1
    %2 = "llvm.urem"(%arg2, %arg1) : (i64, i64) -> i64
    %3 = "llvm.select"(%1, %arg1, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.udiv"(%arg1, %0) : (i64, i64) -> i64
    %5 = "llvm.ashr"(%3, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.udiv"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.icmp"(%6, %3) <{predicate = 8 : i64}> : (i64, i64) -> i1
    "llvm.return"(%7) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

