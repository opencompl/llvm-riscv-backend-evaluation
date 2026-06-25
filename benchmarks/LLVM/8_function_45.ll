"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.srem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.urem"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.sext"(%arg1) : (i32) -> i64
    %4 = "llvm.ashr"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.and"(%arg2, %arg2) : (i64, i64) -> i64
    %6 = "llvm.srem"(%5, %2) : (i64, i64) -> i64
    %7 = "llvm.lshr"(%4, %6) : (i64, i64) -> i64
    "llvm.return"(%7) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

