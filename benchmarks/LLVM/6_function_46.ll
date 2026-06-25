"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.icmp"(%arg0, %arg0) <{predicate = 3 : i64}> : (i64, i64) -> i1
    %1 = "llvm.xor"(%arg0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.urem"(%1, %1) : (i64, i64) -> i64
    %3 = "llvm.and"(%1, %arg1) : (i64, i64) -> i64
    %4 = "llvm.select"(%0, %2, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%5) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

