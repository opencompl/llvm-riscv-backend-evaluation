"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.srem"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.sext"(%arg1) : (i32) -> i64
    %3 = "llvm.urem"(%1, %2) : (i64, i64) -> i64
    "llvm.return"(%3) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

