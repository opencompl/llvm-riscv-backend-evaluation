"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i32, i1)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32, %arg3: i1):
    %0 = "llvm.sext"(%arg2) : (i32) -> i64
    %1 = "llvm.ashr"(%arg1, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.udiv"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.urem"(%2, %arg0) : (i64, i64) -> i64
    %4 = "llvm.select"(%arg3, %arg1, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.lshr"(%4, %3) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.urem"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.icmp"(%2, %6) <{predicate = 7 : i64}> : (i64, i64) -> i1
    "llvm.return"(%7) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

