"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg1, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.lshr"(%arg1, %arg2) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.sext"(%2) : (i32) -> i64
    %4 = "llvm.srem"(%0, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %6 = "llvm.sext"(%5) : (i32) -> i64
    %7 = "llvm.icmp"(%arg0, %6) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.return"(%7) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

