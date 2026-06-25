"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg2, %arg0) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%arg1, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.xor"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.lshr"(%2, %arg0) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

