"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i1, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64, %arg3: i32):
    %0 = "llvm.xor"(%arg2, %arg2) : (i64, i64) -> i64
    %1 = "llvm.zext"(%arg3) : (i32) -> i64
    %2 = "llvm.select"(%arg1, %0, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.ashr"(%arg0, %2) <{isExact}> : (i64, i64) -> i64
    "llvm.return"(%3) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

