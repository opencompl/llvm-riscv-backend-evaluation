"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.ashr"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.and"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.or"(%0, %1) <{isDisjoint}> : (i64, i64) -> i64
    %3 = "llvm.xor"(%arg2, %arg2) : (i64, i64) -> i64
    %4 = "llvm.zext"(%arg3) : (i32) -> i64
    %5 = "llvm.lshr"(%3, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.sdiv"(%2, %5) <{isExact}> : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%7) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

