"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg1, %arg0) : (i64, i64) -> i64
    %1 = "llvm.icmp"(%0, %arg2) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %2 = "llvm.lshr"(%arg1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%0, %2) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.select"(%1, %arg1, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.urem"(%arg0, %4) : (i64, i64) -> i64
    %6 = "llvm.lshr"(%3, %4) <{isExact}> : (i64, i64) -> i64
    %7 = "llvm.icmp"(%5, %6) <{predicate = 7 : i64}> : (i64, i64) -> i1
    "llvm.return"(%7) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

