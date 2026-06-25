"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.and"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.ashr"(%arg0, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.srem"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.srem"(%2, %arg2) : (i64, i64) -> i64
    %4 = "llvm.sext"(%arg3) : (i32) -> i64
    %5 = "llvm.urem"(%4, %4) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%3, %5) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.return"(%6) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

