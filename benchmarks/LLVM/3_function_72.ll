"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i32):
    %0 = "llvm.zext"(%arg1) : (i32) -> i64
    %1 = "llvm.xor"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.icmp"(%arg0, %1) <{predicate = 3 : i64}> : (i64, i64) -> i1
    "llvm.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

