"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg2, %arg0) : (i64, i64) -> i64
    %1 = "llvm.or"(%arg2, %0) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.xor"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.and"(%2, %2) : (i64, i64) -> i64
    %4 = "llvm.xor"(%arg2, %3) : (i64, i64) -> i64
    %5 = "llvm.xor"(%arg1, %4) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%arg0, %5) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.return"(%6) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

