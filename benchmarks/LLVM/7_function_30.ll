"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i1, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1, %arg1: i64):
    %0 = "llvm.trunc"(%arg1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.sext"(%0) : (i32) -> i64
    %2 = "llvm.select"(%arg0, %1, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.lshr"(%1, %arg1) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.and"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.urem"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "llvm.return"(%6) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

