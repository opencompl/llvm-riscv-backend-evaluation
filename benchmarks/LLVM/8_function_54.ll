"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.or"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.zext"(%arg2) : (i32) -> i64
    %2 = "llvm.lshr"(%arg1, %1) : (i64, i64) -> i64
    %3 = "llvm.sext"(%arg2) : (i32) -> i64
    %4 = "llvm.urem"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.and"(%4, %3) : (i64, i64) -> i64
    %6 = "llvm.srem"(%0, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%7) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

