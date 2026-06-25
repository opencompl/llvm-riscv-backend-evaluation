"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i32, i64, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64, %arg3: i1):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.or"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.select"(%arg3, %arg1, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.select"(%arg3, %arg2, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.sdiv"(%2, %0) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.lshr"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.urem"(%1, %5) : (i64, i64) -> i64
    %7 = "llvm.udiv"(%0, %6) : (i64, i64) -> i64
    "llvm.return"(%7) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

