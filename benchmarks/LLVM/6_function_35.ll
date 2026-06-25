"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.sext"(%arg1) : (i32) -> i64
    %1 = "llvm.srem"(%arg2, %arg0) : (i64, i64) -> i64
    %2 = "llvm.udiv"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.zext"(%arg1) : (i32) -> i64
    %4 = "llvm.lshr"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.sdiv"(%arg0, %4) <{isExact}> : (i64, i64) -> i64
    "llvm.return"(%5) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

