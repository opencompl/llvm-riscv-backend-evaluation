"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.xor"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.xor"(%arg1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.xor"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.sdiv"(%1, %3) : (i64, i64) -> i64
    %5 = "llvm.srem"(%4, %arg1) : (i64, i64) -> i64
    %6 = "llvm.xor"(%arg2, %arg0) : (i64, i64) -> i64
    %7 = "llvm.icmp"(%5, %6) <{predicate = 8 : i64}> : (i64, i64) -> i1
    "llvm.return"(%7) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

