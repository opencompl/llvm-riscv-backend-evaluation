"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.sext"(%1) : (i32) -> i64
    %3 = "llvm.urem"(%2, %0) : (i64, i64) -> i64
    %4 = "llvm.and"(%0, %arg1) : (i64, i64) -> i64
    %5 = "llvm.udiv"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.srem"(%5, %4) : (i64, i64) -> i64
    %7 = "llvm.sdiv"(%0, %6) : (i64, i64) -> i64
    "llvm.return"(%7) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

