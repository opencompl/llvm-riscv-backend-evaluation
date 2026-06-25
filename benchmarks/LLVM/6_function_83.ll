"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i32, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.icmp"(%0, %arg1) <{predicate = 4 : i64}> : (i64, i64) -> i1
    %2 = "llvm.ashr"(%arg1, %arg1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.srem"(%2, %arg2) : (i64, i64) -> i64
    %4 = "llvm.select"(%1, %arg1, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.ashr"(%4, %4) <{isExact}> : (i64, i64) -> i64
    "llvm.return"(%5) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

