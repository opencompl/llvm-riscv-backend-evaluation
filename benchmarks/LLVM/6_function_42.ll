"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.urem"(%0, %arg2) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.zext"(%2) : (i32) -> i64
    %4 = "llvm.lshr"(%1, %3) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%5) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

