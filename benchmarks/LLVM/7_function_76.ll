"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1):
    %0 = "llvm.udiv"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.udiv"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.udiv"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.or"(%2, %arg0) : (i64, i64) -> i64
    %4 = "llvm.select"(%arg3, %0, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.or"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%6) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

