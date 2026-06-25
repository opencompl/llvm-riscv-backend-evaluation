"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i32, i32, i1)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i1):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.zext"(%1) : (i32) -> i64
    %3 = "llvm.srem"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.sext"(%arg1) : (i32) -> i64
    %5 = "llvm.select"(%arg2, %0, %4) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %6 = "llvm.srem"(%4, %5) : (i64, i64) -> i64
    %7 = "llvm.srem"(%3, %6) : (i64, i64) -> i64
    "llvm.return"(%7) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

