"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %1 = "llvm.select"(%0, %arg1, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.sext"(%arg3) : (i32) -> i64
    %3 = "llvm.xor"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.ashr"(%arg2, %3) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.and"(%1, %4) : (i64, i64) -> i64
    %6 = "llvm.and"(%5, %arg0) : (i64, i64) -> i64
    "llvm.return"(%6) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

