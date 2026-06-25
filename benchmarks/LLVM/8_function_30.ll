"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.xor"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.zext"(%arg1) : (i32) -> i64
    %2 = "llvm.and"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.ashr"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.and"(%3, %arg2) : (i64, i64) -> i64
    %5 = "llvm.lshr"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.ashr"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.icmp"(%2, %6) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.return"(%7) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

