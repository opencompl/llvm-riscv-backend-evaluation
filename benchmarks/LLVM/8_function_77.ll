"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i1):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.sext"(%0) : (i32) -> i64
    %2 = "llvm.xor"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.select"(%arg2, %2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.sdiv"(%arg1, %arg0) : (i64, i64) -> i64
    %5 = "llvm.srem"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.or"(%arg0, %5) <{isDisjoint}> : (i64, i64) -> i64
    %7 = "llvm.xor"(%2, %6) : (i64, i64) -> i64
    "llvm.return"(%7) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

