"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1):
    %0 = "llvm.and"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.srem"(%arg2, %arg0) : (i64, i64) -> i64
    %2 = "llvm.xor"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.xor"(%arg2, %arg1) : (i64, i64) -> i64
    %4 = "llvm.select"(%arg3, %0, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.srem"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.lshr"(%5, %arg0) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%7) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

