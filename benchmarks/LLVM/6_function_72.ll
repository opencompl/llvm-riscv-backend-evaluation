"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.xor"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%arg2, %arg2) : (i64, i64) -> i64
    %2 = "llvm.udiv"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.srem"(%3, %0) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "llvm.return"(%5) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

