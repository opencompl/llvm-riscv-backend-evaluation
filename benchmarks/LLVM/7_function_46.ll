"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.icmp"(%arg0, %arg0) <{predicate = 5 : i64}> : (i64, i64) -> i1
    %1 = "llvm.ashr"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.urem"(%arg0, %arg2) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.sext"(%3) : (i32) -> i64
    %5 = "llvm.ashr"(%arg1, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.select"(%0, %1, %5) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "llvm.return"(%6) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

