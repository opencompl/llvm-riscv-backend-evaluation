"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i1, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i1, %arg3: i32):
    %0 = "llvm.select"(%arg2, %arg0, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.sext"(%arg3) : (i32) -> i64
    %2 = "llvm.udiv"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.and"(%arg1, %2) : (i64, i64) -> i64
    %4 = "llvm.select"(%arg2, %3, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.and"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.and"(%arg0, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%7) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

