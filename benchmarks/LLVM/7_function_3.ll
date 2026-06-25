"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.sdiv"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.or"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.zext"(%arg2) : (i32) -> i64
    %3 = "llvm.srem"(%1, %2) : (i64, i64) -> i64
    %4 = "llvm.sext"(%arg2) : (i32) -> i64
    %5 = "llvm.ashr"(%4, %4) : (i64, i64) -> i64
    %6 = "llvm.udiv"(%3, %5) : (i64, i64) -> i64
    "llvm.return"(%6) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

