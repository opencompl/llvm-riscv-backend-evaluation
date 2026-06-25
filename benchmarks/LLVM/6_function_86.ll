"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i1):
    %0 = "llvm.or"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.or"(%0, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.and"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.select"(%arg2, %2, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.xor"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.or"(%2, %4) <{isDisjoint}> : (i64, i64) -> i64
    "llvm.return"(%5) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

