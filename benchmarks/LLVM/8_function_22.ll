"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %1 = "llvm.lshr"(%arg0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.ashr"(%1, %arg2) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.urem"(%arg1, %2) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%arg2, %arg1) : (i64, i64) -> i64
    %5 = "llvm.select"(%0, %4, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %6 = "llvm.select"(%0, %3, %5) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%7) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

