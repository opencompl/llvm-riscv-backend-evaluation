"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.udiv"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.urem"(%arg2, %arg2) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%arg2, %1) : (i64, i64) -> i64
    %3 = "llvm.or"(%arg1, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %4 = "llvm.srem"(%3, %2) : (i64, i64) -> i64
    %5 = "llvm.lshr"(%2, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.srem"(%0, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%7) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

