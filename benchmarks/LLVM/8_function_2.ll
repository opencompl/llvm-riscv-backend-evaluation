"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.sext"(%arg1) : (i32) -> i64
    %1 = "llvm.and"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.sext"(%arg1) : (i32) -> i64
    %3 = "llvm.urem"(%arg2, %2) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%1, %3) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.and"(%arg0, %4) : (i64, i64) -> i64
    %6 = "llvm.urem"(%arg2, %0) : (i64, i64) -> i64
    %7 = "llvm.urem"(%5, %6) : (i64, i64) -> i64
    "llvm.return"(%7) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

