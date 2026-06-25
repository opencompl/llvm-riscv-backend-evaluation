"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.and"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.trunc"(%arg1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.zext"(%1) : (i32) -> i64
    %3 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.sext"(%3) : (i32) -> i64
    %5 = "llvm.udiv"(%arg2, %4) : (i64, i64) -> i64
    %6 = "llvm.lshr"(%2, %5) <{isExact}> : (i64, i64) -> i64
    %7 = "llvm.icmp"(%0, %6) <{predicate = 3 : i64}> : (i64, i64) -> i1
    "llvm.return"(%7) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

