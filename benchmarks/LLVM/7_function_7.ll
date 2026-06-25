"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.lshr"(%arg2, %arg0) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.and"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%arg0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.urem"(%2, %1) : (i64, i64) -> i64
    %4 = "llvm.sext"(%arg3) : (i32) -> i64
    %5 = "llvm.or"(%4, %3) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%3, %5) <{predicate = 6 : i64}> : (i64, i64) -> i1
    "llvm.return"(%6) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

