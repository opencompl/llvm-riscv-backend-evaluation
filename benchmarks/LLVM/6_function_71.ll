"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.ashr"(%0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.lshr"(%2, %arg2) : (i64, i64) -> i64
    %4 = "llvm.ashr"(%3, %0) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%5) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

