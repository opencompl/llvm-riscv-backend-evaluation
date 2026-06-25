"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i1, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.select"(%arg1, %arg2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.urem"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.udiv"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.ashr"(%0, %1) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.xor"(%3, %arg2) : (i64, i64) -> i64
    %5 = "llvm.lshr"(%3, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.icmp"(%2, %5) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.return"(%6) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

