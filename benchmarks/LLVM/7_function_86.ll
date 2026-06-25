"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.sext"(%arg1) : (i32) -> i64
    %1 = "llvm.or"(%0, %0) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.sext"(%2) : (i32) -> i64
    %4 = "llvm.srem"(%3, %arg2) : (i64, i64) -> i64
    %5 = "llvm.udiv"(%arg0, %4) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%6) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

