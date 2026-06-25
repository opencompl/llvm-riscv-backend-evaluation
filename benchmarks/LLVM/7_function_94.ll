"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.sdiv"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.srem"(%arg2, %arg2) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%1, %arg0) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.srem"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%3, %arg0) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.sdiv"(%0, %4) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "llvm.return"(%6) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

