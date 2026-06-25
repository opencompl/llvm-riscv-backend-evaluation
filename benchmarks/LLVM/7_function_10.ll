"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i32, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.lshr"(%0, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.udiv"(%1, %1) : (i64, i64) -> i64
    %3 = "llvm.srem"(%arg2, %2) : (i64, i64) -> i64
    %4 = "llvm.urem"(%arg1, %3) : (i64, i64) -> i64
    %5 = "llvm.urem"(%1, %4) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%2, %5) <{predicate = 3 : i64}> : (i64, i64) -> i1
    "llvm.return"(%6) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

