"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i1):
    %0 = "llvm.urem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.ashr"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.zext"(%2) : (i32) -> i64
    %4 = "llvm.select"(%arg2, %1, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.urem"(%3, %4) : (i64, i64) -> i64
    "llvm.return"(%5) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

