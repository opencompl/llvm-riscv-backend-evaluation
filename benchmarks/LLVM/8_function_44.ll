"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.sdiv"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.zext"(%1) : (i32) -> i64
    %3 = "llvm.urem"(%0, %0) : (i64, i64) -> i64
    %4 = "llvm.and"(%arg2, %3) : (i64, i64) -> i64
    %5 = "llvm.sdiv"(%arg1, %arg0) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.or"(%4, %5) <{isDisjoint}> : (i64, i64) -> i64
    %7 = "llvm.icmp"(%2, %6) <{predicate = 5 : i64}> : (i64, i64) -> i1
    "llvm.return"(%7) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

