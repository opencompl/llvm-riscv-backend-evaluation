"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i1, i64, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.urem"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.zext"(%arg3) : (i32) -> i64
    %2 = "llvm.urem"(%1, %1) : (i64, i64) -> i64
    %3 = "llvm.xor"(%arg1, %2) : (i64, i64) -> i64
    %4 = "llvm.srem"(%3, %0) : (i64, i64) -> i64
    %5 = "llvm.sdiv"(%arg1, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.select"(%arg0, %0, %5) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%7) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

